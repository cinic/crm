# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead do
    name "MyString"
    mobile "MyString"
    apartment nil
    employer nil
  end
end
