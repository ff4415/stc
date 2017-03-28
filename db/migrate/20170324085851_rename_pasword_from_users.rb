class RenamePaswordFromUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :pasword_digest, :password_digest
    end
  end
end
