module Namespace
  module MyEngine2
    class Engine < ::Rails::Engine
      isolate_namespace Namespace::MyEngine2
    end
  end
end
