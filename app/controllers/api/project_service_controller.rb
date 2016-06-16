module Api
  # project service api
  class ProjectServiceController < Api::Core
  #  before_action :require_api_authorization

    soap_service namespace: "/api/#{controller_name}/wsdl", description: 'Very cool description about this service'

    # Simple case
    soap_action 'create_or_update',
                args: Api::ProjectType,
                args_description: { project: 'desription about element A here' },
                return: :boolean, to: :create_or_update

    def create_or_update
      render soap: true
    end

    soap_action 'get_namespace',  args: { :mail  => :string, 'projectid' => :integer, 'project_type' => Api::TestNamespace::TestType },
                                  args_description: {
                                    mail: 'desription about mail element here',
                                    'projectid' => 'description about projectid attr',
                                    'project_type' => 'description about project_type attr'
                                  },
                                  return: :boolean, to: :namespace_method

    def namespace_method
      render soap: true
    end

    soap_action 'fluffy',  args: { :members  =>  Api::FluffyContainer, :users_array => [User], 'projectid' => Api::Fluffy, 'project_type' => :string },
                           args_description: {
                             members: 'desription about fluffly container',
                             'users_array' => 'description about users array attr',
                              'projectid' => 'description about projectid attr',
                              'project_type' => 'description about project type' },
                           return: :boolean, to: :fluffy_method

    def fluffy_method
      render soap: true
    end

    soap_action 'add_members', args: { :members  =>  [{ mail: :string }], 'redmine_projectid' => :integer, 'project_type' => :string },
     args_description: {
       members: "some description about members",
       redmine_projectid: "some description about redmine_projectid",
        project_type: "some description about project_type"

     },
     return: :boolean, to: :add_members_method

    def add_members_method
      render soap: true
    end
  end
end
