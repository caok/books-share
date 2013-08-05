class Settings < Settingslogic
  source "#{Rails.root}/config/application.yml"
  namespace Rails.env
  load! if Rails.env.development?
end
