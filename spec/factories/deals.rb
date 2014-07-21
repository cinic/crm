# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
    employer nil
    renter nil
    agent nil
    apartment nil
    user nil
    price 1
    deposit 1
    communal false
    lease_term 1
    commission 1
    date "2014-07-22 00:47:06"
  end
end
