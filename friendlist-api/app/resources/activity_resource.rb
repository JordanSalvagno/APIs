class ActivityResource < JSONAPI::Resource
  attributes :id, :user_id, :title, :message, :city, :state, :zip
  has_one :user

  filters :zip
end
