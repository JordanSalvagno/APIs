class MessageResource < JSONAPI::Resource
  attributes :id, :user_to_id, :user_from_id, :message_body, :dateSent
  belongs_to :user_to, :class_name => 'User'
  belongs_to :user_from, :class_name => 'User'

  def dateSent
    @model.created_at.strftime("%I:%M:%S %p %Z %m-%d-%Y")
  end

  filters :user_from_id
end
