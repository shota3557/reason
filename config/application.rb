require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module Reason
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.test_framework :rspec,
        model_specs: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
    end
  end
end
