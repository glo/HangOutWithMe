FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    phone    "1234567890"
    password "foobar"
    password_confirmation "foobar"
  end
end