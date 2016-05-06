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

60.times do
  user = User.all.sample
  random_user = User.all.sample
  user.followers << random_user unless user.id == random_user.id
end

60.times do
  user = User.all.sample
  random_user = User.all.sample
  user.followees << random_user unless user.id == random_user.id
end
