module Api
  class Fluffy < WashOut::Type
    map universe: {
      name: :string,
      age: :int
    }
  end
end
