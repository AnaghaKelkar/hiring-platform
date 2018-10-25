FactoryBot.define do
  factory :user do
  	name "Test User"
    email "test@example.com"
    password "test123"
    loginable FactoryBot.create(:admin)
  end
end
