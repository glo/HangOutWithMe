FactoryGirl.define do
  factory :user do
# Factory.define :user do |user|
    sequence (:name) { |n| "Person #{n}" }
    sequence (:email) { |n| "person_#{n}@example.com" }
    provider  "Facebook"
    sequence (:uid) { |n| "UID #{n}" }
    phone "1234567890" 
  end
 
 # Should make admin users at some point   
#    factory :admin do
#      admin true
#    end
#  end

  factory :event do
    activity "Lorem ipsum"
    location "Somewhere"
    start_time "2012-06-29 09:23:04 -0400"
    user
  end
    
  #  name     "Michael Hartl"
  #  email    "michael@example.com"
  # uid       "1234567"
  #  phone    "1234567890"
  #  password "foobar"
  #  password_confirmation "foobar"
  
end