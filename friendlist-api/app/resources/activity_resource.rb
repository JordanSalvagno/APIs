class ActivityResource < JSONAPI::Resource
  attributes :id, :user_id, :user_image, :title, :message, :city, :state, :zip, :interested_users, :users_attending
  has_one :user
  has_many :activity_users

  def interested_users
    @model.activity_users.collect { |u|{activityUserId: u.id, accepted: u.accepted, denied: u.denied, user: u.user}}
  end
  
  def user_image
    @model.user.image
  end

  def users_attending
    users = @model.activity_users.map{|u| u.user if (u.accepted)}.compact
    users.push(@model.user);
  end

  filters :zip
end
