30.times do
  User.create(
             name: Faker::Name.name,
             email: Faker::Internet.email,
             handle: Faker::Internet.user_name,
             password: Faker::Internet.password(8)
             )
end

50.times do
  user = User.all.sample
  user.tweets << Tweet.create!(content: Faker::StarWars.quote[0...140])
end
