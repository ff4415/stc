class ClassRoom < ActiveRecord::Base
  has_many :match_user_and_classrooms
  has_many :users, :through => :match_user_and_classrooms
end
