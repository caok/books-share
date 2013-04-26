require 'spec_helper'

describe BooksController do
  let(:user) { create :member_user }
  let(:book) { create :book, :user => user }

  describe "GET#index" do
    it "should have an index action" do
      get :index
      response.should be_success
    end
  end

  describe "GET#new" do
    describe "unauthenticated" do
      it "should not allow anonymous access" do
        get :new
        response.should_not be_success
        flash[:alert].should eql(I18n.t('unauthorized.default'))
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

  describe "POST#create" do
    context "when user has signed in" do
      before(:each) do
        sign_in user
      end

      let(:valid_attributes) { attributes_for(:book) }

      context 'with valid attributes' do
        it 'creates the book' do
          expect {
            post 'create', :book => valid_attributes
          }.to change{Book.count}.by(1)
        end
      end
    end

    context 'when user has not signed in' do
      it "should be redirect" do
        post 'create'
        response.should be_redirect
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end
  end

  describe "GET#edit" do
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
          flash[:alert].should eql(I18n.t('unauthorized.default'))
        end
      end
    end
  end

  describe "PUT#update" do
    let(:valid_attributes) { attributes_for(:book) }

    context 'when user has signed in' do
      before(:each) do
        sign_in user
      end
      context 'with valid attributes' do
        it 'update the book' do
          put 'update', :id => book.id, :book => valid_attributes
          response.should redirect_to(book)
        end
      end
    end

    context 'when user has not signed in' do
      it "should be redirect" do
        put 'update', :id => book.id, :book => valid_attributes
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end
  end

  describe "DELETE#destroy" do
    context 'when user has not signed in' do
      it "should be redirect" do
        delete :destroy, id: book.id
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end

    context 'when user has signed in' do
      before(:each) do
        sign_in user
      end

      it 'can destroy the book blongs to him' do
        delete :destroy, id: book.id
        response.should redirect_to books_path
      end

      it 'can not destroy the book blongs to other' do
        book1 = create :book
        delete :destroy, id: book1.id
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end
  end
end
