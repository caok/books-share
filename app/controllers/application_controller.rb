class ApplicationController < ActionController::Base
  protect_from_forgery

  # cancan exception handler   
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: I18n.t("unauthorized.default")
  end
end
