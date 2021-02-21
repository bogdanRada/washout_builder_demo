class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :process_soap_parameters

  def test_soap
    require 'savon'
    token = TestApp::Application.config.api_auth_token
    client = Savon::Client.new(
      wsdl: root_url + '/api/rumbas/wsdl',
      ssl_verify_mode: :none,
      ssl_version: :TLSv1, # [:SSLv3, :TLSv1, :SSLv2]
      # convert_request_keys_to: :none, #  [:camelcase, :lower_camelcase, :upcase, :none]
      open_timeout: 30,
      read_timeout: 30,
      # soap_header: { 'authToken:' => token },
      log: true,
      log_level: :debug,
      logger: Rails.logger,
      follow_redirects: true,
      raise_errors: true,
      pretty_print_xml: true,
      filters: [:authToken],
    )

    client.operations # => [:integer_to_string, :concat, :add_circle]

    result = client.call(:concat, message: { 'a' => '123', 'b' => 'abc' })

    render json: result.to_hash # => {:value=>"123abc"}
  end

  # for some reason the params are not populated on rails 6.1 so we use the env to populate them
  def process_soap_parameters
    envelope = (request.env['wash_out.soap_data'] || {}).values_at(:envelope, :Envelope).compact.first || {}
    xml_data = (envelope.values_at(:body, :Body).compact.first || {}).with_indifferent_access
    if xml_data.key?(action_name)
      old_parameters = (request.headers["action_dispatch.request.parameters"] || {}).with_indifferent_access
      data = old_parameters.merge(xml_data[action_name])
      request.headers['action_dispatch.request.parameters'] = data.with_indifferent_access
    end
  end

  # for some reason the params are not populated on rails 6.1
  def params
    original = super
    if original.to_unsafe_h.with_indifferent_access != request.params.with_indifferent_access
      ActionController::Parameters.new(request.params.with_indifferent_access)
    else
      original
    end
  end
end
