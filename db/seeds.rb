require 'faker'

15.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Crypto.md5
  )
end

users = User.all

25.times do
  Topic.create!(
    user: users.sample,
    title: Faker::Space.planet
  )
end

topics = Topic.all

100.times do
  bookmark = Bookmark.create!(
    url: "www." + Faker::Space.constellation + ".com",
    topic: topics.sample
  )
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
