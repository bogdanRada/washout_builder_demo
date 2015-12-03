module Api
  module TestNamespace
    class TestType < WashOut::Type
      map test_type: {
        name: :string,
        description: :string,
        users: [{ mail: :string }],
        'dada'  => [User],
        #   'data2' => [Api::ProjectType]
      }
    end
  end
end
