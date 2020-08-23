# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
Plan.create!(menu:"フリー",
             created_at: "2020-08-22 00:00:00",
             finished_at: "2020-08-22 05:00:00",
             note:"旅行", 
             prefectures: "東京都",
             city: "港区",
             town: "芝公園４丁目２−８",
             user_id: 1)             
Plan.create!(menu:"フリー",
             created_at: "2020-08-22 00:30:00",
             finished_at: "2020-08-22 09:30:00",
             note:"ドライブ",
            user_id: 1) 
Plan.create!(menu:"勉強",
             created_at: "2020-08-22 01:00:00",
             finished_at: "2020-08-22 09:00:00",
             note:"Rails",
            user_id: 1)
Plan.create!(menu:"運動",
             created_at: "2020-08-22 01:30:00",
             finished_at: "2020-08-22 09:30:00",
             note:"ランニング",
            user_id: 1)
Plan.create!(menu:"仕事",
             created_at: "2020-08-22 02:00:00",
             finished_at: "2020-08-22 11:00:00",
             note:"プログラマ",
            user_id: 1)
Plan.create!(menu:"フリー",
             created_at: "2020-08-21 09:00:00",
             finished_at: "2020-08-21 13:00:00",
             note:"ドライブ",
            user_id: 1)
Plan.create!(menu:"勉強",
             created_at: "2020-08-21 10:00:00",
             finished_at: "2020-08-21 13:00:00",
             note:"Rails",
            user_id: 1)
Plan.create!(menu:"運動",
             created_at: "2020-08-21 14:00:00",
             finished_at: "2020-08-21 18:00:00",
             note:"ランニング",
            user_id: 1)
Plan.create!(menu:"仕事",
             created_at: "2020-08-21 19:00:00",
             finished_at: "2020-08-21 21:00:00",
             note:"プログラマ",
            user_id: 1)
Plan.create!(menu:"食事",
             created_at: "2020-08-21 20:00:00",
             finished_at: "2020-08-21 23:55:00",
             note:"ラーメン",
            user_id: 1)
Plan.create!(menu:"睡眠",
             created_at: "2020-07-01 10:00:00",
             finished_at: "2020-07-01 19:00:00",
             note:"自宅",
            user_id: 1)
Plan.create!(menu:"フリー",
             created_at: "2020-07-01 10:00:00",
             finished_at: "2020-07-01 19:00:00",
             note:"ドライブ",
            user_id: 1)
             
User.create!(name: "一般ユーザー1",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password")
             
Plan.create!(menu:"フリー",
             created_at: "2020-08-1 08:00:00",
             finished_at: "2020-08-1 17:00:00",
             note:"旅行", 
             prefectures: "東京都",
             city: "港区",
             town: "芝公園４丁目２−８",
             user_id: 2)             
Plan.create!(menu:"仕事",
             created_at: "2020-08-15 10:00:00",
             finished_at: "2020-08-15 19:00:00",
             note:"プログラマ",
            user_id: 2)
Plan.create!(menu:"食事",
             created_at: "2020-08-15 19:00:00",
             finished_at: "2020-08-15 20:00:00",
             note:"ラーメン",
            user_id: 2)
Plan.create!(menu:"睡眠",
             created_at: "2020-08-16 10:00:00",
             finished_at: "2020-08-16 19:00:00",
             note:"自宅",
            user_id: 2)
Plan.create!(menu:"勉強",
             created_at: "2020-09-1 09:00:00",
             finished_at: "2020-09-1 18:00:00",
             note:"Ruby",
            user_id: 2) 
Plan.create!(menu:"運動",
             created_at: "2020-10-1 10:00:00",
             finished_at: "2020-10-1 19:00:00",
             note:"ランニング",
            user_id: 2)
            
User.create!(name: "一般ユーザー2",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password")
             
Plan.create!(menu:"フリー",
             created_at: "2020-08-1 08:00:00",
             note:"自宅",
             user_id: 3)             
Plan.create!(menu:"勉強",
             created_at: "2020-09-1 09:00:00",
             finished_at: "2020-09-1 18:00:00",
             note:"プログラミング",
            user_id: 3) 
Plan.create!(menu:"運動",
             created_at: "2020-09-1 10:00:00",
             finished_at: "2020-09-1 19:00:00",
             note:"バスケ",
            user_id: 3)
             

63.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end