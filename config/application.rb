require_relative "boot"

require "rails/all"
require "rack/cors"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rsm
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths << Rails.root.join("convert_date")
    config.autoload_paths += %W(#{config.root}/lib)
    config.middleware.use PDFKit::Middleware
    config.active_job.queue_adapter = :sidekiq
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    if Rails.env.production?
      config.session_store :cookie_store, key: 'frecruit_session', domain: ".domain_name.com"
    else
      config.session_store :cookie_store, key: 'frecruit_session', domain: '.lvh.me'
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
