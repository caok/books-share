require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TranslatorsController do

  # This should return the minimal set of attributes required to create a valid
  # Translator. As you add validations to Translator, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TranslatorsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all translators as @translators" do
      translator = Translator.create! valid_attributes
      get :index, {}, valid_session
      assigns(:translators).should eq([translator])
    end
  end

  describe "GET show" do
    it "assigns the requested translator as @translator" do
      translator = Translator.create! valid_attributes
      get :show, {:id => translator.to_param}, valid_session
      assigns(:translator).should eq(translator)
    end
  end

  describe "GET new" do
    it "assigns a new translator as @translator" do
      get :new, {}, valid_session
      assigns(:translator).should be_a_new(Translator)
    end
  end

  describe "GET edit" do
    it "assigns the requested translator as @translator" do
      translator = Translator.create! valid_attributes
      get :edit, {:id => translator.to_param}, valid_session
      assigns(:translator).should eq(translator)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Translator" do
        expect {
          post :create, {:translator => valid_attributes}, valid_session
        }.to change(Translator, :count).by(1)
      end

      it "assigns a newly created translator as @translator" do
        post :create, {:translator => valid_attributes}, valid_session
        assigns(:translator).should be_a(Translator)
        assigns(:translator).should be_persisted
      end

      it "redirects to the created translator" do
        post :create, {:translator => valid_attributes}, valid_session
        response.should redirect_to(Translator.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved translator as @translator" do
        # Trigger the behavior that occurs when invalid params are submitted
        Translator.any_instance.stub(:save).and_return(false)
        post :create, {:translator => { "name" => "invalid value" }}, valid_session
        assigns(:translator).should be_a_new(Translator)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Translator.any_instance.stub(:save).and_return(false)
        post :create, {:translator => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested translator" do
        translator = Translator.create! valid_attributes
        # Assuming there are no other translators in the database, this
        # specifies that the Translator created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Translator.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => translator.to_param, :translator => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested translator as @translator" do
        translator = Translator.create! valid_attributes
        put :update, {:id => translator.to_param, :translator => valid_attributes}, valid_session
        assigns(:translator).should eq(translator)
      end

      it "redirects to the translator" do
        translator = Translator.create! valid_attributes
        put :update, {:id => translator.to_param, :translator => valid_attributes}, valid_session
        response.should redirect_to(translator)
      end
    end

    describe "with invalid params" do
      it "assigns the translator as @translator" do
        translator = Translator.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Translator.any_instance.stub(:save).and_return(false)
        put :update, {:id => translator.to_param, :translator => { "name" => "invalid value" }}, valid_session
        assigns(:translator).should eq(translator)
      end

      it "re-renders the 'edit' template" do
        translator = Translator.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Translator.any_instance.stub(:save).and_return(false)
        put :update, {:id => translator.to_param, :translator => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested translator" do
      translator = Translator.create! valid_attributes
      expect {
        delete :destroy, {:id => translator.to_param}, valid_session
      }.to change(Translator, :count).by(-1)
    end

    it "redirects to the translators list" do
      translator = Translator.create! valid_attributes
      delete :destroy, {:id => translator.to_param}, valid_session
      response.should redirect_to(translators_url)
    end
  end

end
