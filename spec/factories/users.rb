# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'caricatura'
    password_confirmation 'caricatura'
  end
end
