# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Paul"
    last_name "Dornfeld"
    phone_number "617-504-8901"
    sequence(:email) { |n| "pdornfel#{n}@gmail.com" }
    password "1234"
  end
end
