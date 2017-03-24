class CreateMatchUserAndClassrooms < ActiveRecord::Migration
  def change
    create_table :match_user_and_classrooms do |t|
      t.belongs_to :user, index: true
      t.belongs_to :class_room, index: true
      t.datetime :match_user_and_classroom_date

      t.timestamps null: false
    end
  end
end
