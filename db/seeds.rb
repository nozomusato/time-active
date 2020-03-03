# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
Plan.create!(created_at: "2020-03-01 00:00:00",
             finished_at: "2020-03-02 00:00:00",
            user_id: 1)
             
User.create!(name: "佐藤望",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password")
             

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end