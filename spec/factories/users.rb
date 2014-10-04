# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    full_name "Paul Dornfeld"
    sequence(:email) { |n| "pdornfel#{n}@gmail.com" }
    password "1234"
  end
end
