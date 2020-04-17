# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
Plan.create!(menu:"フリー",
             created_at: "2020-04-1 08:00:00",
             finished_at: "2020-04-1 17:00:00",
             note:"旅行", 
             prefectures: "東京都",
             city: "港区",
             town: "芝公園４丁目２−８",
             user_id: 1)             
Plan.create!(menu:"勉強",
             created_at: "2020-05-1 09:00:00",
             finished_at: "2020-05-1 18:00:00",
             note:"Ruby",
            user_id: 1) 
Plan.create!(menu:"運動",
             created_at: "2020-06-1 10:00:00",
             finished_at: "2020-06-1 19:00:00",
             note:"ランニング",
            user_id: 1)
Plan.create!(menu:"仕事",
             created_at: "2020-04-15 10:00:00",
             finished_at: "2020-04-15 19:00:00",
             note:"プログラマ",
            user_id: 1)
Plan.create!(menu:"食事",
             created_at: "2020-04-15 10:00:00",
             finished_at: "2020-04-15 19:00:00",
             note:"バスケ",
            user_id: 1)
Plan.create!(menu:"睡眠",
             created_at: "2020-04-16 10:00:00",
             finished_at: "2020-04-16 19:00:00",
            user_id: 1)
             
User.create!(name: "佐藤望",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password")
             
Plan.create!(menu:"フリー",
             created_at: "2020-04-1 08:00:00",
             finished_at: "2020-04-1 17:00:00",
             note:"旅行",
             user_id: 2)             
Plan.create!(menu:"勉強",
             created_at: "2020-05-1 09:00:00",
             finished_at: "2020-05-1 18:00:00",
             note:"Ruby",
            user_id: 2) 
Plan.create!(menu:"運動",
             created_at: "2020-06-1 10:00:00",
             finished_at: "2020-06-1 19:00:00",
             note:"ランニング",
            user_id: 2)
            
User.create!(name: "佐藤桃子",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password")
             
Plan.create!(menu:"フリー",
             created_at: "2020-07-1 08:00:00",
             finished_at: "2020-07-1 17:00:00",
             note:"自宅",
             user_id: 3)             
Plan.create!(menu:"勉強",
             created_at: "2020-08-1 09:00:00",
             finished_at: "2020-08-1 18:00:00",
             note:"プログラミング",
            user_id: 3) 
Plan.create!(menu:"運動",
             created_at: "2020-09-1 10:00:00",
             finished_at: "2020-09-1 19:00:00",
             note:"バスケ",
            user_id: 3)
             

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end