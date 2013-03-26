require "spec_helper"

describe TranslatorsController do
  describe "routing" do

    it "routes to #index" do
      get("/translators").should route_to("translators#index")
    end

    it "routes to #new" do
      get("/translators/new").should route_to("translators#new")
    end

    it "routes to #show" do
      get("/translators/1").should route_to("translators#show", :id => "1")
    end

    it "routes to #edit" do
      get("/translators/1/edit").should route_to("translators#edit", :id => "1")
    end

    it "routes to #create" do
      post("/translators").should route_to("translators#create")
    end

    it "routes to #update" do
      put("/translators/1").should route_to("translators#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/translators/1").should route_to("translators#destroy", :id => "1")
    end

  end
end
