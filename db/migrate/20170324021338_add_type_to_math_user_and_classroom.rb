class AddTypeToMathUserAndClassroom < ActiveRecord::Migration
  def change
    change_table :match_user_and_classrooms do |t|
      t.string :type
    end
  end
end
