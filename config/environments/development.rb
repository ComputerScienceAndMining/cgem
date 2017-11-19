Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Better Errors + Docker development container
  BetterErrors::Middleware.allow_ip! ENV['TRUSTED_IP'] if ENV['TRUSTED_IP']

  # Web Console
  config.web_console.whitelisted_ips = ENV['TRUSTED_IP'] if ENV['TRUSTED_IP']

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Default URL options for the Devise mailer
  config.action_mailer.default_url_options = { host: ENV.fetch('MAILER_URL_HOST'), port: ENV.fetch('MAILER_URL_PORT') }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_options = {
    from: ENV.fetch('MAILER_FROM')
  }
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            ENV.fetch('MAILER_USERNAME'),
    password:             ENV.fetch('MAILER_PASS'),
    authentication:       'plain',
    enable_starttls_auto: true
  }
  

  # Paperclip
  #Paperclip.options[:command_path] = "/usr/local/bin/"
  Paperclip.options[:content_type_mappings] = {
    :jpeg => "image/jpeg",
    :jpg => "image/jpeg",
    :png => "image/png"
  }

  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV.fetch('AWS_S3_BUCKET_NAME'),
      access_key_id: ENV.fetch('AWS_S3_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_S3_SECRET_ACCESS_KEY'),
      s3_region: ENV.fetch('AWS_S3_REGION'),
      s3_host_name: "s3-#{ENV['AWS_S3_REGION']}.amazonaws.com",
    }
  }
end
