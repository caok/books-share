class ApplicationController < ActionController::Base
  protect_from_forgery

  # cancan exception handler   
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
