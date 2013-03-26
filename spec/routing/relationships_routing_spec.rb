require "spec_helper"

describe RelationshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/relationships").should route_to("relationships#index")
    end

    it "routes to #new" do
      get("/relationships/new").should route_to("relationships#new")
    end

    it "routes to #show" do
      get("/relationships/1").should route_to("relationships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/relationships/1/edit").should route_to("relationships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/relationships").should route_to("relationships#create")
    end

    it "routes to #update" do
      put("/relationships/1").should route_to("relationships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/relationships/1").should route_to("relationships#destroy", :id => "1")
    end

  end
end
