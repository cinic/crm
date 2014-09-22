# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :money_status, :class => 'Money::Status' do
    description "MyString"
  end
end
