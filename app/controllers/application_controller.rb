class ApplicationController < ActionController::Base
  protect_from_forgery

  # cancan exception handler
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: I18n.t("unauthorized.default")
  end

  protected
  def sphinx_escape(s, default='')
    s = default.strip if s.nil?
    keywords = s.split(/\s+/).map{|k| Riddle.escape("#{k}")}
    keywords.join(' | ')
  end
end
