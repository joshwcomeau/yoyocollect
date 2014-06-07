require 'rails_helper'

describe "Users API" do
	describe "GET /api/yoyos" do
		# before(:each) do
		# 	@user  = FactoryGirl.create(:user, email: "foo", password: "bar")

		# end

		it "creates a new user" do
	    post "/api/users", {
	    	user: {
		    	email: 		"test@test.com",
		    	password: "testtest1",
		    	password_confirmation: 		"testtest1"
		    }
	    }, format: :json

	    # response.should be_success
	    expect(response.status).to eq(200)

	    user = json

	    expect(User.last["email"]).to eq("test@test.com")
	  end

		# it "returns an array of manufacturer names" do
		# 	get "/api/yoyos", {}, { "Accept" => "application/json" }

		# 	expect(response.status).to eq(200)

		# 	manufacturers = json.map { |m| m["name"] }

		# 	expect(manufacturers).to match_array(["YoYoCompany", "Company Lodge Yoyo Works"])

		# end




	end
end