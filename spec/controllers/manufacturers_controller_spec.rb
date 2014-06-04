require_relative "../rails_helper"

describe ManufacturersController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end


    it "loads all of the manufacturers into @manufacturers" do
      manufacturer1, manufacturer2 = Manufacturer.create!, Manufacturer.create!
      get :index

      expect(assigns(:manufacturers)).to match_array([manufacturer1, manufacturer2])
    end
  end
end