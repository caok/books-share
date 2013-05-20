require 'spec_helper'

describe LikesController do
  let!(:usr) {create :member_user}
  let!(:book) {create :book, user: usr}
  before(:each) do
    request.env["HTTP_REFERER"] = root_path
  end
  before {controller.stub!(:current_user).and_return(usr)}
  context "post#create" do
    it "should create link" do
      expect do 
        post :create, {resource_name: 'Book', resource_id: book.id}
      end.to change{book.like_count}.by(1) 
    end
  end
end