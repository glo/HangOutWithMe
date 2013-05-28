namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_events
  end
end
    
def make_users
  
# Don't need admin stuff until I have admins  
#  admin = User.create!(name: "Example User",
#                       email: "example@railstutorial.org",
#                       uid: "12345",
#                       provider: "facebook",
#                       phone: "1234567890")
#  admin.toggle!(:admin)
  9.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    uid = n
    phone = "{n}{n}{n}{n}{n}{n}{n}{n}{n}{n}"
#    image = "http://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Lamprotornis_hildebrandti_-Tanzania-8-2c.jpg/250px-Lamprotornis_hildebrandti_-Tanzania-8-2c.jpg"
    User.create!(name: name, email: email, uid: uid, provider: "facebook",
                 phone: phone)
  end
end    
    
def make_events    
    users = User.all(limit: 6)
    50.times do
      activity = Faker::Lorem.sentence(5)
      location = Faker::Lorem.sentence(5)
      users.each { |user| user.events.create!(activity: activity, location: location) }
    end
end