require 'rails_helper'

describe "Yoyos API" do
	describe "GET /api/yoyos" do
		before(:each) do
			@user  = FactoryGirl.create(:user, email: "foo", password: "bar")

		end

		it "returns an array of manufacturer names" do
			get "/api/yoyos", {}, { "Accept" => "application/json" }

			expect(response.status).to eq(200)

			manufacturers = json.map { |m| m["name"] }

			expect(manufacturers).to match_array(["YoYoCompany", "Company Lodge Yoyo Works"])

		end




	end
end