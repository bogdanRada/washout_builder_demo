class Api::ProjectServiceController < Api::Core
  before_filter  :require_api_authorization

  soap_service  namespace: "#{Rails.configuration.api_namespace}project_service/wsdl", description: "Very cool description about this service"

  # Simple case
  soap_action "create_or_update",  :args   => Api::ProjectType , :return => :boolean,  :to => :create_or_update


  def create_or_update
    render :soap => true
  end

  soap_action "get_namespace",  :args   => {:mail  => :string, 'projectid' => :integer, "project_type"=> Api::TestNamespace::TestType }, :return => :boolean,  :to => :namespace_method

  def namespace_method
  render :soap => true
  end

  soap_action "fluffy",  :args   => {:members  =>  Api::FluffyContainer  , 'projectid' => Api::Fluffy, 'project_type' => :string} , :return => :boolean,  :to => :fluffy_method

  def fluffy_method
    render :soap => true
  end

  soap_action "add_members",  :args   => {:members  =>  [{:mail => :string }] , 'redmine_projectid' => :integer, 'project_type' => :string} , :return => :boolean,  :to => :add_members_method

  def add_members_method
    render :soap => true
  end

end
