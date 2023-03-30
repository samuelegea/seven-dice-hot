require "rails_helper"

RSpec.describe WeaponPropertiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/weapon_properties").to route_to("weapon_properties#index")
    end

    it "routes to #new" do
      expect(get: "/weapon_properties/new").to route_to("weapon_properties#new")
    end

    it "routes to #show" do
      expect(get: "/weapon_properties/1").to route_to("weapon_properties#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/weapon_properties/1/edit").to route_to("weapon_properties#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/weapon_properties").to route_to("weapon_properties#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/weapon_properties/1").to route_to("weapon_properties#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/weapon_properties/1").to route_to("weapon_properties#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/weapon_properties/1").to route_to("weapon_properties#destroy", id: "1")
    end
  end
end
