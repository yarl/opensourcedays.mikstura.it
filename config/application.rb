require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(:default, Rails.env)

module OpensourcedaysMiksturaIt
  class Application < Rails::Application
    config.time_zone = 'Warsaw'
    config.i18n.default_locale = :en
    config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/pages"
  end
end
