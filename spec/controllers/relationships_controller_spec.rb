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

describe RelationshipsController do

  # This should return the minimal set of attributes required to create a valid
  # Relationship. As you add validations to Relationship, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "tag" => "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RelationshipsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all relationships as @relationships" do
      relationship = Relationship.create! valid_attributes
      get :index, {}, valid_session
      assigns(:relationships).should eq([relationship])
    end
  end

  describe "GET show" do
    it "assigns the requested relationship as @relationship" do
      relationship = Relationship.create! valid_attributes
      get :show, {:id => relationship.to_param}, valid_session
      assigns(:relationship).should eq(relationship)
    end
  end

  describe "GET new" do
    it "assigns a new relationship as @relationship" do
      get :new, {}, valid_session
      assigns(:relationship).should be_a_new(Relationship)
    end
  end

  describe "GET edit" do
    it "assigns the requested relationship as @relationship" do
      relationship = Relationship.create! valid_attributes
      get :edit, {:id => relationship.to_param}, valid_session
      assigns(:relationship).should eq(relationship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Relationship" do
        expect {
          post :create, {:relationship => valid_attributes}, valid_session
        }.to change(Relationship, :count).by(1)
      end

      it "assigns a newly created relationship as @relationship" do
        post :create, {:relationship => valid_attributes}, valid_session
        assigns(:relationship).should be_a(Relationship)
        assigns(:relationship).should be_persisted
      end

      it "redirects to the created relationship" do
        post :create, {:relationship => valid_attributes}, valid_session
        response.should redirect_to(Relationship.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved relationship as @relationship" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relationship.any_instance.stub(:save).and_return(false)
        post :create, {:relationship => { "tag" => "invalid value" }}, valid_session
        assigns(:relationship).should be_a_new(Relationship)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relationship.any_instance.stub(:save).and_return(false)
        post :create, {:relationship => { "tag" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested relationship" do
        relationship = Relationship.create! valid_attributes
        # Assuming there are no other relationships in the database, this
        # specifies that the Relationship created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Relationship.any_instance.should_receive(:update_attributes).with({ "tag" => "" })
        put :update, {:id => relationship.to_param, :relationship => { "tag" => "" }}, valid_session
      end

      it "assigns the requested relationship as @relationship" do
        relationship = Relationship.create! valid_attributes
        put :update, {:id => relationship.to_param, :relationship => valid_attributes}, valid_session
        assigns(:relationship).should eq(relationship)
      end

      it "redirects to the relationship" do
        relationship = Relationship.create! valid_attributes
        put :update, {:id => relationship.to_param, :relationship => valid_attributes}, valid_session
        response.should redirect_to(relationship)
      end
    end

    describe "with invalid params" do
      it "assigns the relationship as @relationship" do
        relationship = Relationship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Relationship.any_instance.stub(:save).and_return(false)
        put :update, {:id => relationship.to_param, :relationship => { "tag" => "invalid value" }}, valid_session
        assigns(:relationship).should eq(relationship)
      end

      it "re-renders the 'edit' template" do
        relationship = Relationship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Relationship.any_instance.stub(:save).and_return(false)
        put :update, {:id => relationship.to_param, :relationship => { "tag" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested relationship" do
      relationship = Relationship.create! valid_attributes
      expect {
        delete :destroy, {:id => relationship.to_param}, valid_session
      }.to change(Relationship, :count).by(-1)
    end

    it "redirects to the relationships list" do
      relationship = Relationship.create! valid_attributes
      delete :destroy, {:id => relationship.to_param}, valid_session
      response.should redirect_to(relationships_url)
    end
  end

end
