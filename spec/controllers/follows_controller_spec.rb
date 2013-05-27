require 'spec_helper'

describe FollowsController do
  let(:usr1) { create :member_user }
  let!(:usr) { create :member_user }
  let!(:book) { create :book, user: usr}
  before(:each) do
    request.env["HTTP_REFERER"] = root_path
    usr1.follow book
    sign_in usr
  end
  #before {controller.stub!(:current_user).and_return(usr)}
  context "post#create" do
    it "should create link" do
      expect do 
        post :create, { id: book.id }
      end.to change { usr.following_books_count }.by(1) 
    end
  end
  
  context "delete#destroy" do
    it "destroy the current user like" do
      usr.follow book
      expect do
        delete :destroy, { id: book.id }
      end.to change { usr.following_books_count }.by(-1)
    end
  end
end