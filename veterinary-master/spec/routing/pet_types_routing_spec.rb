require "spec_helper"

describe PetTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/pet_types").should route_to("pet_types#index")
    end

    it "routes to #new" do
      get("/pet_types/new").should route_to("pet_types#new")
    end

    it "routes to #show" do
      get("/pet_types/1").should route_to("pet_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pet_types/1/edit").should route_to("pet_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pet_types").should route_to("pet_types#create")
    end

    it "routes to #update" do
      put("/pet_types/1").should route_to("pet_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pet_types/1").should route_to("pet_types#destroy", :id => "1")
    end

  end
end
