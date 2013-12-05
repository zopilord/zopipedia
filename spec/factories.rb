FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| 'user#{n}@example.com' }
    password 'caricatura'
    password_confirmation 'caricatura'
  end

  factory :wiki do
  	user
  	title "First Wiki"
  	body "MyString"
  end
end
