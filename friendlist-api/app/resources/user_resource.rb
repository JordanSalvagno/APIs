class UserResource < JSONAPI::Resource
  attributes :id, :username, :name, :email, :city, :zip, :state, :bio
  has_many :activities
  has_many :ratings
  has_many :comments, :class_name => 'Rating', :foregin_key => 'rater_id'
end
