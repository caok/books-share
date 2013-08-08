class SessionsController < ApplicationController

  def create
    user = User.from_auth(request.env['omniauth.auth'])
    sign_in user
    redirect_to root_path
  end
end
