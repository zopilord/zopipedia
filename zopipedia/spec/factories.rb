FactoryGirl.define do
	factory :user do
		sequence :email do |n|
			"foo#{n}@example.com"
		end	 
		password "foodbar"
		role "member"
	end

	factory :wiki do
		sequence :title do |n| 
			"wiki #{n}"
		end	
		body "Wiki wiki wiki"
	end
end	
