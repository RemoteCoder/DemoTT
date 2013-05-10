namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name:"admin", email:"admin@shah.com",password:"123456", password_confirmation:"123456")
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
end