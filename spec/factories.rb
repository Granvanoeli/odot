FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    sequence(:email) { |n| "user#{n}@example.com" } # Defines the message for the creation of the email 
    password "supersecure123"
    password_confirmation "supersecure123"
  end
end