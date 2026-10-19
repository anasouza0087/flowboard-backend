require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module FlowboardBackend
  class Application < Rails::Application
    config.api_only = true
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    # CORS configuration
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "http://localhost:3000" # Replace with your frontend URL

        resource "*",
                 headers: :any,
                 methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
                 expose: [ "Authorization" ],
                 credentials: true
      end
    end
  end
end
