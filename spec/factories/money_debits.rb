# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :money_debit, :class => 'Money::Debit' do
    contractor "MyString"
    category nil
    status nil
    deal nil
    user nil
    amount "9.99"
    date "2014-09-20 17:27:44"
    description "MyText"
  end
end
