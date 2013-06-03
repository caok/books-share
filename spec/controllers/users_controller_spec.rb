require 'spec_helper'

describe UsersController do
  let(:user) { create :member_user }

  describe "GET#show" do
    it "should have an show action" do
      get :show, :id => user.id
      response.should be_success
    end
  end
end
