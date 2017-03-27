require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DtiWeb
  class Application < Rails::Application

    config.autoload_paths += %W(#{config.root}/lib/workers)
    config.eager_load_paths += %W(#{config.root}/lib/workers)

    # config.autoload_paths += %W(#{config.root}/lib)

    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.perform_deliveries = true

    # config.action_mailer.delivery_method = :smtp

    # ActionMailer::Base.smtp_settings = {
    #   :authentication => :plain,
    #   :address => "smtp.mailgun.org",
    #   :port => 25,
    #   :domain => "sandbox791b997bb3a84a5fb83f44baedb6be1c.mailgun.org",
    #   :user_name => "postmaster@sandbox791b997bb3a84a5fb83f44baedb6be1c.mailgun.org",
    #   :password => "*******"
    # }

    #confirmacion
    ActionMailer::Base.smtp_settings = {
      :address             => 'smtp.gmail.com',
      :port                =>  587,
      :domain              =>  'mail.google.com',
      :user_name           =>  'dtiunheval@gmail.com',
      :password            =>  '123unheval',
      :authentication      =>  'login',
      :enable_starttls_auto =>  true
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
