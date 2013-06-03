require 'spec_helper'

describe BooksController do
  let(:user) { create :member_user }
  let(:book) { create :book, :user => user }

  describe "GET#index" do
    it "should have an index action" do
      book = create :book
      get :index
      response.should be_success
      assigns(:books).should eq([book])
    end

    it "populates an array of books with tag" do
      book = create :book, :tag_list => 'vi'
      book1 = create :book
      get :index, tag: "vi"
      response.should be_success
      assigns(:books).should eq([book])
    end

    it "populates an array of books with author" do
      book = create :book, :author_list => 'ryan'
      book1 = create :book
      get :index, author: "ryan"
      response.should be_success
      assigns(:books).should eq([book])
    end

    it "populates an array of books with translator" do
      book = create :book, :translator_list => 'clark'
      book1 = create :book
      get :index, translator: "clark"
      response.should be_success
      assigns(:books).should eq([book])
    end
  end

  describe "GET#show" do
    it "should have an show action" do
      get :show, :id => book.id
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

      context 'with valid attributes' do
        let(:valid_attributes) { attributes_for(:book) }
        it 'creates the book' do
          expect {
            post 'create', :book => valid_attributes
          }.to change{Book.count}.by(1)
        end
      end

      context "with invalid attributes" do
        let(:invalid_attributes) { attributes_for(:invalid_book) }
        it "does not save the new book" do
          expect{
            post :create, book: invalid_attributes
          }.to_not change(Book, :count)
        end

        it "re-renders the new method" do
          post :create, book: invalid_attributes
          response.should render_template :new
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
    let(:invalid_attributes) { attributes_for(:invalid_book) }

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

      context "with invalid attributes" do
        it "locates the requested book" do
          put :update, id: book, book: invalid_attributes
          assigns(:book).should eq(book)
        end

        it "re-renders the edit method" do
          put :update, id: book, book: invalid_attributes
          response.should render_template :edit
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
        book = create :book, :user => user
        expect {
          delete :destroy, id: book.id
        }.to change{Book.count}.by(-1)
      end

      it 'can not destroy the book blongs to other' do
        book1 = create :book
        delete :destroy, id: book1.id
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end
  end

  describe 'GET#auto_new' do
    context 'when user has not signed in' do
      it "should be redirect" do
        get :auto_new
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end

    it 'it can work' do
      sign_in user
      get :auto_new
      response.code.should eq('200')
    end
  end

  describe 'Post#auto_create' do
    context 'when user has not signed in' do
      it "should be redirect" do
        post :auto_create, douban: {:index=>21382184}
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end

    context 'when user has signed in' do
      before(:each){ sign_in user }
      it "when input index number is not exites" do
        lambda{
          post :auto_create, douban: {:index=>0}
        }.should change(Book, :count).by(0)
      end

      it "re-renders the auto_new method" do
        post :auto_create, douban: {:index=>0}
        response.should render_template :auto_new
      end

      it "when input right number" do
        lambda{
          post :auto_create, douban: {:index=>'23860404'}
        }.should change(Book, :count).by(1)
      end
    end
  end

  describe 'Post#follow' do
    before(:each) do
      sign_in user
      controller.stub(:current_user).and_return(user)
    end

    context "post#create" do
      it "should add followers_count" do
        expect do
          post :follow, id: book.id
          user.follow book
        end.to change { book.reload.followers_count }.by(1)
      end
    end

    context "delete#destroy" do
      it "destroy the current user like" do
        user.follow book
        expect do
          #post :unfollow, id: book.id
          user.stop_following book
        end.to change { book.followers_count }.by(-1)
      end
    end
  end
end
