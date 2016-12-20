class UserResource < JSONAPI::Resource
  attributes :id, :username, :name, :email, :city, :zip, 
    :state, :bio, :image, :largeImage, :received_from_users, 
    :activities_attended, :total_rating
  has_many :activities
  has_many :ratings
  has_many :comments, :class_name => 'Rating', :foregin_key => 'rater_id'
  has_many :messages_sent, :class_name => 'Message', :foregin_key => 'user_from_id'
  has_many :messages_recieved, :class_name => 'Message', :foregin_key => 'user_to_id'
  has_many :activity_users

  def received_from_users
    users = @model.messages_recieved.collect{|m| m.user_from}
    users.uniq
  end

  def activities_attended
    attendedActivities = @model.activity_users.collect{|a| a.activity if a.accepted == true}
    userActivities = @model.activities.collect{|a| a}
    attendedActivities | userActivities
  end

  def total_rating
    i = 0.0
    score = 0.0
      @model.ratings.each do |r|
        score += r.score
        i += 1.0
      end
    score/i
  end
end
