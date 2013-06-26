require 'spec_helper'

describe UsersController do
  let(:user) { create :member_user }

  describe "GET#show" do
    it "should have an show action" do
      sign_in_with_valid_user user
      get :show, id: user.id
      response.should be_success
    end
  end

  describe "GET show" do
    it "should redirect to use login path, if no login" do
      get :show, id: user.id
      response.should redirect_to(new_user_session_path)
    end
  end

end
