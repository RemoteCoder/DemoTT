namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name:"admin",
                       email:"admin@shah.com",
                       password:"123456",
                       password_confirmation:"123456")
  admin.toggle!(:admin)
  shah = User.create!(name:"Shah",
                      email: "shah@shah.com",
                      password: "123456",
                      password_confirmation: "123456")
  shah.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "test-#{n+1}@shah.com"
    password = "123456"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each {|user| user.microposts.create!(content: content)}
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[3..50]
  followers = users[4..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user)}
end