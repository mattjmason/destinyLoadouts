class AddUsersColumnToLoadouts < ActiveRecord::Migration[5.2]
  def change
    add_column :loadouts, :user_id, :integer
  end
end
