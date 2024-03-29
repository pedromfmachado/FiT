Fit::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :test

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  require 'tlsmail'
  Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => '192.168.55.224' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => 'geral.fit@gmail.com',
    :password             => 'FiT#12345',
    :authentication       => 'plain',
  }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
end

