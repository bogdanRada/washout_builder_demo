module Api
  # rumbas api
  class RumbasController < Api::Core
    soap_service namespace: "/api/#{controller_name}/wsdl", description: 'Very cool description about this service'
    # Simple case
    soap_action 'integer_to_string',
                args: :integer,
                args_description: { value: 'desription about value element here' },
                return: :string
    def integer_to_string
      render soap: params[:value].to_s
    end

    soap_action 'concat',
                args: { a: :string, b: :string },
                args_description: { a: 'desription about element A here', b: 'description about element B here' },
                return: :string
    def concat
      render soap: (params[:a] + params[:b])
    end

    # Complex structures
    soap_action 'AddCircleOne',
                args: { circle_one: { center_one: { x: :integer,
                                                    y: :integer },
                                      radius: :double } },
                args_description: { circle_one: 'desription about the Circle object here' },
                return: nil, # [] for wash_out below 0.3.0
                to: :add_circle
    def add_circle
      circle = params[:circle]

      fail SOAPError, 'radius is too small' if circle[:radius] < 3.0

      Circle.new(circle[:center][:x], circle[:center][:y], circle[:radius])

      render soap: nil
    end

    # Arrays
    soap_action 'integers_to_boolean',
                args: { data: [:integer] },
                args_description: { data: 'desription about the Data element here' },
                return: [:boolean]
    def integers_to_boolean
      render soap: params[:data].map { |x| x ? 1 : 0 }
    end

    # Params from XML attributes;
    # e.g. for a request to the 'AddCircle' action:
    #   <soapenv:Envelope>
    #     <soapenv:Body>
    #       <AddCircle>
    #         <Circle radius="5.0">
    #           <Center x="10" y="12" />
    #         </Circle>
    #       </AddCircle>
    #     </soapenv:Body>
    #   </soapenv:Envelope>
    soap_action 'AddCircleTwo',
                args: { circle: { :center => { :@x => :integer,
                                               :@y => :integer },
                                  :@radius => :double } },
                args_description: { circle: 'description about the Circle object here' },
                return: nil, # [] for wash_out below 0.3.0
                to: :add_circle_two
    def add_circle_two
      circle = params[:circle]
      Circle.new(circle[:center][:x], circle[:center][:y], circle[:radius])

      render soap: nil
    end

    # With a customised input tag name, in case params are wrapped;
    # e.g. for a request to the 'IntegersToBoolean' action:
    #   <soapenv:Envelope>
    #     <soapenv:Body>
    #       <MyRequest>  <!-- not <IntegersToBoolean> -->
    #         <Data>...</Data>
    #       </MyRequest>
    #     </soapenv:Body>
    #   </soapenv:Envelope>
    soap_action 'integers_to_request',
                args: { my_request: { data: [:integer] } },
                args_description: { my_request: 'description about the MyRequest object here' },
                as: 'MyRequest',
                return: [:boolean]
  end
end
