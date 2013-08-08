ActionMailer::Base.smtp_settings = {
  :address              => Settings.smtp.address,
  :port                 => Settings.smtp.port,
  :domain               => Settings.smtp.domain,
  :user_name            => Settings.smtp.user_name,
  :password             => Settings.smtp.password,
  :authentication       => Settings.smtp.authentication,
  :enable_starttls_auto => true
}

#ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
