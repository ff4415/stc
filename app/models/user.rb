class User < ActiveRecord::Base
  before_save {self.name = name.downcase}
  has_many :match_user_and_classrooms
  has_many :class_rooms, :through => :match_user_and_classrooms

  has_secure_password
  validates :password, presence: true, length: {maximum: 6}
end
