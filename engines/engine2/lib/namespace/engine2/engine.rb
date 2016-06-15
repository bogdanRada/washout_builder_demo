module Namespace
  module Engine2
    class Engine < ::Rails::Engine
      isolate_namespace Namespace::Engine2
      config.assets.precompile += %w(
      )
    end
  end
end
