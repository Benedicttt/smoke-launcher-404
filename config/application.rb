require_relative 'boot'
require 'rails/all'
require 'bundler/setup'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LauncherBinomo
  class Application < Rails::Application
    config.exceptions_app = self.routes
     config.action_cable.mount_path = '/launcher'
     config.que.worker_count = 1
     Rails.application.config.action_cable.allowed_request_origins = ['http://rubyonrails.com', /http:\/\/ruby.*/]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.autoload_paths += [ config.root.join('app') ]
    # config.autoload_paths += Dir["#{config.root}/features/temporary/*"]
    # config.que.mode = :async
    # Que.mode = :async
    # Que::Job.work

  end
end
