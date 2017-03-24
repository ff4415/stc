class User < ActiveRecord::Base
  has_many :match_user_and_classrooms
  has_many :class_rooms, :through => :match_user_and_classrooms
end
