# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback_message do
    user nil
    message "MyText"
    status "MyString"
    ticket_number "MyString"
  end
end
