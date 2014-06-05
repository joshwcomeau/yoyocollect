require 'rails_helper'

describe "Yoyos API" do
	describe "GET /api/yoyos" do
		it "returns an array of manufacturer names" do
			company = FactoryGirl.create(:manufacturer, name: "YoYoCompany")
			company = FactoryGirl.create(:manufacturer, name: "Company Lodge Yoyo Works")

			get "/api/yoyos", {}, { "Accept" => "application/json" }

			expect(response.status).to eq(200)

			body = JSON.parse(response.body)
			manufacturers = body.map { |m| m["name"] }

			expect(manufacturers).to match_array(["YoYoCompany", "Company Lodge Yoyo Works"])

		end

		it "returns an array of yoyos" do
			company = FactoryGirl.create(:manufacturer, name: "YoYoCompany")
			FactoryGirl.create(:yoyo, manufacturers: [company], model: "Spinning Mayhem")
			FactoryGirl.create(:yoyo, manufacturers: [company], model: "Spinning Mayhem 2")
			company2 = FactoryGirl.create(:manufacturer, name: "YoYoCompany2")
			FactoryGirl.create(:yoyo, manufacturers: [company2], model: "Wooly Elephant")

			get "/api/yoyos", {}, { "Accept" => "application/json" }

			expect(response.status).to eq(200)

			body = JSON.parse(response.body)
			yoyos = []
			body.each do |m|
				m["yoyos"].each do |y|
					yoyos << y["model"]
				end
			end

			expect(yoyos).to match_array(["Spinning Mayhem", "Spinning Mayhem 2", "Wooly Elephant"])

		end
	end
end