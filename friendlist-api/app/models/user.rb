class User < ApplicationRecord
  has_many :activities
  has_many :ratings
  has_many :comments, :class_name => 'Rating', :foreign_key => 'rater_id'
end
