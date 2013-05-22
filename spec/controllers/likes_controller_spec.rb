require 'spec_helper'

describe LikesController do
  let(:usr1) { create :member_user }
  let!(:usr) { create :member_user }
  let!(:book) { create :book, user: usr}
  before(:each) do
    request.env["HTTP_REFERER"] = root_path
    usr1.like! book
    sign_in usr
  end
  #before {controller.stub!(:current_user).and_return(usr)}
  context "post#create" do
    it "should create link" do
      expect do 
        post :create, {resource_name: 'Book', resource_id: book.id}
      end.to change{Book.find(book.id).like_count}.by(1) 
    end
  end
  
  context "delete#destroy" do
    it "destroy the current user like" do
      usr.like! book
      expect do
        delete :destroy, { resource_name: 'Book', resource_id: book.id }
      end.to change { Book.find(book.id).like_count }.by(-1)
    end
  end
end