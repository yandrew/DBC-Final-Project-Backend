config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            'notifications.sellme',
  password:             'randeep1',
  authentication:       'plain',
  enable_starttls_auto: true  }