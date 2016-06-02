module Client
  class Engine < ::Rails::Engine
    isolate_namespace Client
    config.assets.precompile += %w(
      client.js
    )
  end
end
