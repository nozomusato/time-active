# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
Plan.create!(menu:"食事",
             updated_at: "2020-01-1 10:00:00",
             created_at: "2020-01-1 10:00:00",
             finished_at: "2020-01-1 19:00:00",
             user_id: 1)             
Plan.create!(menu:"フリー",
             updated_at: "2020-02-1 08:00:00",
             created_at: "2020-02-1 08:00:00",
             finished_at: "2020-02-1 17:00:00",
            user_id: 1) 
Plan.create!(menu:"仕事",
             updated_at: "2020-03-1 09:00:00",
             created_at: "2020-03-1 09:00:00",
             finished_at: "2020-03-1 18:00:00",
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