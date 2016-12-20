urls = 
  ["http://gocartoonme.com/wp-content/uploads/2015/04/cartoon-my-picture.png",
   "http://alltrickszone.com/wp-content/uploads/2016/10/funny-whatsapp-animated-cartoon-dp-of-a-man-with-red-tie-300x300.jpg",
   "http://img-cache.cdn.gaiaonline.com/cb169e9027fff085d64539efee4f8b46/http://i1208.photobucket.com/albums/cc368/LittleCandyDucky/derpy-pokemon.gif",
   "https://static-cdn.jtvnw.net/jtv_user_pictures/daywithcartoon-profile_image-2970de40e7f7950d-300x300.jpeg",
   "https://static-cdn.jtvnw.net/jtv_user_pictures/dizzygrenade-profile_image-b4615b148519143a-300x300.jpeg",
   "http://theracecardproject.com/wp-content/uploads/2015/07/Profile-Photo1-300x300.jpg",
   "http://projectamalousalam.org/wp_live/wp-content/uploads/2015/04/Michelle-Everson-Profile-300x300.png",
   "http://chariotsolutions.com/wp-content/uploads/event/2015/11/kevin-geecon-profile-300x300.jpg",
   "http://www.frontiermarketingllc.com/wp-content/uploads/2015/07/KyleC-Profile-Picture-300x300-300x300.jpg",
   "https://content-static.upwork.com/blog/uploads/sites/3/2015/04/29170635/VickyPhan_Headshot1-300x300.jpg",
   "https://www.huify.com/hs-fs/hub/341761/file-973340855-png/images/Josh-Harcus-Head-Only-300x300-Profile-Pic.png?t=1480719268541",
   "http://cdn.lib-tech.com/wp-content/uploads/2013/08/Benny-Schmitt-Profile-300x300.jpg",
   "https://static-cdn.jtvnw.net/jtv_user_pictures/hnl-profile_image-d21b6802ad451f6c-300x300.jpeg",
   "https://17720-presscdn-0-11-pagely.netdna-ssl.com/wp-content/uploads/2016/05/mike-profile-300x300.jpg",
   "https://85ery2mn8pk3g63883igyf9w-wpengine.netdna-ssl.com/wp-content/uploads/2016/05/ZachProfileGlasses-366w-300x300.jpg",
   "http://arts.vcu.edu/wp-content/blogs.dir/65/files/2016/04/profile-picture_Fitzgerald-300x300.jpg",
   "https://www.agriculturemorethanever.ca/wp-content/uploads/2016/04/Agvocate-profile-Dusty-300x300.jpg"]
   
   


image = urls.sample
user = User.create(
  [
    {email: 'a@a.com', username: Faker::Internet.user_name,password: "aaaaaaaa", password_confirmation: "aaaaaaaa", name: Faker::Name.name, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, bio: Faker::Hacker.say_something_smart, image: image,largeImage: image}
  ]
)
20.times do
  image = urls.sample
  user = User.create(
    [
      {password: "aaaaaaaa", password_confirmation: "aaaaaaaa", username: Faker::Internet.user_name, name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, bio: Faker::Hacker.say_something_smart, image: image, largeImage: image}
    ]
  )
end

users = User.all
users.each do |user|
  8.times do
    user.activities.create(
      title: [Faker::Hacker.adjective, Faker::Hacker.noun].join(' ').titleize,
      message: Faker::Hacker.say_something_smart, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip)
  end
  user.activities.create(
    title: [Faker::Hacker.adjective, Faker::Hacker.noun].join(' ').titleize,
    message: Faker::Hacker.say_something_smart, city: "Chico", state: "California", zip: 95973)
  user.activities.create(
    title: [Faker::Hacker.adjective, Faker::Hacker.noun].join(' ').titleize,
    message: Faker::Hacker.say_something_smart, city: "Chico", state: "California", zip: 95928)
  user.ratings.create(comment: Faker::Hacker.say_something_smart, score: Faker::Number.between(1,5), rater_id: (rand 20) + 1)
  user.messages_sent.create(message_body: Faker::Hacker.say_something_smart, user_to_id: (rand 20) + 1)
  user.messages_sent.create(message_body: Faker::Hacker.say_something_smart, user_to_id: (rand 20) + 1)
end

activities = Activity.all
activities.each do |activity|
  # create access objects for current image
  user_indexes = Array.new
  size = 3 + rand(6)
  for i in 0..size
    while (user_indexes[i] = (rand 20) + 1) == activity.user_id
    end
  end
  user_indexes.uniq!
  accepted = [true, false]
  user_indexes.each do |user_id|
    ActivityUser.create(user_id: user_id, activity_id: activity.id, accepted: accepted.sample)
  end
end
