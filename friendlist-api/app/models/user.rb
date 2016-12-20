class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :activities
  has_many :ratings
  has_many :comments, :class_name => 'Rating', :foreign_key => 'rater_id'
  has_many :messages_sent, :class_name => 'Message', :foreign_key => 'user_from_id'
  has_many :messages_recieved, :class_name => 'Message', :foreign_key => 'user_to_id'
  has_many :activity_users
end
