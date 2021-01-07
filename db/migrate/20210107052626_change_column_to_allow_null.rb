class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]

  def up
    change_column :users, :instagram, :string, null: true
    change_column :users, :twitter, :string, null: true
    change_column :users, :line, :string, null: true
  end

  def down
    change_column :users, :instagram, :string, null: false
    change_column :users, :twitter, :string, null: false
    change_column :users, :line, :string, null: false
  end

end
