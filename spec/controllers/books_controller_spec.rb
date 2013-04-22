require 'spec_helper'

describe BooksController do
  let(:user) { create :member_user }
  let(:book) { create :book, :user => user }

  describe ":index" do
    it "should have an index action" do
      get :index
      response.should be_success
    end
  end

  describe ":new" do
    describe "unauthenticated" do
      it "should not allow anonymous access" do
        get :new
        response.should_not be_success
      end
    end

    describe "authenticated" do
      it "should allow access from authenticated user" do
        sign_in user
        get :new
        response.should be_success
      end
    end
  end

  describe ":edit" do
    context "unauthenticated" do
      it "should not allow anonymous access" do
        get :edit, :id => book.id
        response.should_not be_success
      end
    end

    context "authenticated" do
      context "own book" do
        it "should allow access from authenticated user" do
          sign_in user
          get :edit, :id => book.id
          response.should be_success
        end
      end

      context "other's book" do
        it "should not allow edit" do
          other_user = create :member_user
          book_of_other_user = create(:book, :user => other_user)
          sign_in user
          get :edit, :id => book_of_other_user.id
          response.should_not be_success
        end
      end
    end
  end
end
