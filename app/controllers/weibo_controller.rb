class WeiboController < ActionController::Base


  def connect
    client = WeiboOAuth2::Client.new
    redirect_to client.authorize_url
  end

  def callback
    client = WeiboOAuth2::Client.new
    access_token = client.auth_code.get_token(params[:code].to_s)
    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at
    sina_user = client.users.show_by_uid(session[:uid].to_i)
    sign_in User.find_or_generate sina_user
    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to root_path
  end


  protected

  def reset_session
    session[:uid] = nil
    session[:access_token] = nil
    session[:expires_at] = nil
  end

end

