module Api
  class ProjectInfoType < WashOut::Type
    map project_info: {
      :name                                    => :string,
      :description                           => :string,
    }
  end
end
