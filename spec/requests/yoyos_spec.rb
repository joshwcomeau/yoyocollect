require 'rails_helper'

describe "Yoyos API" do
	describe "GET /api/yoyos" do
		it "returns the manufacturer" do
			company = FactoryGirl.create(:manufacturer, name: "YoYoCompany")
			company = FactoryGirl.create(:manufacturer, name: "Company Lodge Yoyo Works")
			# FactoryGirl.create(:yoyo, companies: [company])

			get "/api/yoyos", {}, { "Accept" => "application/json" }

			expect(response.status).to eq(200)

			body = JSON.parse(response.body)
			manufacturers = body.map { |m| m["name"] }

			expect(manufacturers).to match_array(["YoYoCompany", "Company Lodge Yoyo Works"])

		end
	end
end