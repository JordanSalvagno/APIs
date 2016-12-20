class ActivityUserResource < JSONAPI::Resource
  attributes :id, :activity_id, :user_name, :activity_title, :accepted, :denied
  belongs_to :user
  belongs_to :activity

  def user_name 
    @model.user.username
  end

  def activity_title
    @model.activity.title
  end
  filters :accepted, :denied
end
