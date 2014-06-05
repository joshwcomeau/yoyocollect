FactoryGirl.define do
	factory :manufacturer do

	end

	factory :yoyo do
		manufacturers {[FactoryGirl.create(:manufacturer)]}
		model "Spinning Mayhem"
		diameter 52.5
	end
end