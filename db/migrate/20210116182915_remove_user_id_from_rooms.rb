class RemoveUserIdFromRooms < ActiveRecord::Migration[5.2]

  def up
    remove_column :rooms, :user_id, :string
  end

  def down
    add_column :rooms, :user_id, :string
  end

end
