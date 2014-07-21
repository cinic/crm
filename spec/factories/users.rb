# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Test Test"
    email "test@test.com"
    password "password"
    role 2
    last_login "2014-07-21 22:58:44"
    mobile "+7 911 184-20-61"
  end
end
