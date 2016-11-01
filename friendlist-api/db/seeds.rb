20.times do
user1 = User.where(username: Faker::Internet.user_name, name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, bio: Faker::Hacker.say_something_smart).create
user2 = User.where(username: Faker::Internet.user_name, name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, bio: Faker::Hacker.say_something_smart).create

  activity = user1.activities.create(
    title: [Faker::Hacker.adjective, Faker::Hacker.noun].join(' ').titleize,
    message: Faker::Hacker.say_something_smart, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip
  )
  activity2 = user2.activities.create(
    title: [Faker::Hacker.adjective, Faker::Hacker.noun].join(' ').titleize,
    message: Faker::Hacker.say_something_smart, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip
  )
  rating = user1.ratings.create(comment: Faker::Hacker.say_something_smart, score: Faker::Number.decimal(1), rater_id: user2.id)
end
