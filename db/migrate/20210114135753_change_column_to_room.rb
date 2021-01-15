class ChangeColumnToRoom < ActiveRecord::Migration[5.2]

    def up
      change_column :rooms, :user_id, :string, null: true
    end

    def down
      change_column :rooms, :user_id, :string, null: false
    end

end
