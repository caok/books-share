require 'spec_helper'

describe ResourcesController do
  let(:user) { create :member_user }
  let(:book) { create :book }
  let(:resource) { create :resource, :user => user, :book => book }

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
    #context "when user has signed in" do
      #before(:each) do
        #sign_in user
      #end

      #let(:valid_attributes) { attributes_for(:resource) }

      #context 'with valid attributes' do
        #it 'creates the resource' do
          #expect {
            #post 'create', :resource => valid_attributes
          #}.to change{Resource.count}.by(1)
          #response.should redirect_to(resource.book)
        #end
      #end
    #end

    context 'when user has not signed in' do
      it "should be redirect" do
        post 'create'
        response.should be_redirect
      end
    end
  end

  describe "GET#edit" do
    context "unauthenticated" do
      it "should not allow anonymous access" do
        get :edit, :id => resource.id
        response.should_not be_success
      end
    end

    context "authenticated" do
      context "own resource" do
        it "should allow access from authenticated user" do
          sign_in user
          get :edit, :id => resource.id
          response.should be_success
        end
      end

      context "other's resource" do
        it "should not allow edit" do
          other_user = create :member_user
          resource_of_other_user = create(:resource, :user => other_user)
          sign_in user
          get :edit, :id => resource_of_other_user.id
          response.should_not be_success
        end
      end
    end
  end

  describe "PUT#update" do
    let(:valid_attributes) { attributes_for(:resource) }

    context 'when user has signed in' do
      before(:each) do
        sign_in user
      end
      context 'with valid attributes' do
        it 'update the resource' do
          put 'update', :id => resource.id, :resource => valid_attributes
          response.should redirect_to(resource)
        end
      end
    end

    context 'when user has not signed in' do
      it "should be redirect" do
        put 'update', :id => resource.id, :resource => valid_attributes
        response.should be_redirect
      end
    end
  end

  describe "DELETE#destroy" do
    context 'when user has not signed in' do
      it "should be redirect" do
        delete :destroy, id: resource.id
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end

    context 'when user has signed in' do
      before(:each) do
        sign_in user
      end

      it 'can destroy the resource blongs to him' do
        delete :destroy, id: resource.id
        response.should redirect_to resources_path
      end

      it 'can not destroy the resource blongs to other' do
        resource1 = create :resource
        delete :destroy, id: resource1.id
        response.should redirect_to root_path
        flash[:alert].should eql(I18n.t('unauthorized.default'))
      end
    end
  end
end
