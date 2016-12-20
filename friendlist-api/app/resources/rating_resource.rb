class RatingResource < JSONAPI::Resource
  attributes :id, :user_id, :rater_id, :comment, :score, :raterinfo
  belongs_to :user
  belongs_to :rater, :class_name => 'User'

  def raterinfo
    @model.rater
  end
end
