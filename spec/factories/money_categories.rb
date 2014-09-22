# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :money_category, :class => 'Money::Category' do
    description "MyString"
  end
end
