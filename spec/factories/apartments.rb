# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apartment do
    metro "MyString"
    address "MyString"
    rooms 1
    only_room false
    adjacent_rooms false
    apartment_size 1.5
    kitchen_size 1.5
    rooms_size "MyString"
    balcony_size 1.5
    balcony false
    balcony_glazed false
    repairing false
    floor 1
    floors 1
    furnished false
    kitchen_furnished false
    phone false
    tv false
    fridge false
    washer false
    animals false
    kids false
    bathroom_with_toilet false
    deposit 1
    deposit_divide false
    near "MyString"
    when_see "MyString"
    when_placed "MyString"
    comment "MyText"
  end
end
