class RemoveTypeFromMatchUserAndClassrooms < ActiveRecord::Migration
  def change
    remove_column :match_user_and_classrooms, :type, :string
  end
end
