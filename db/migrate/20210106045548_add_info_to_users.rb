class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    change_column :users, :name, :string, null: false

    add_column :users, :age, :integer
    change_column :users, :age, :integer, null: false

    add_column :users, :introduction, :text
    change_column :users, :introduction, :text, null: false

    add_column :users, :profile_image_id, :string
    change_column :users, :profile_image_id, :string, null: false

    add_column :users, :instagram, :string
    change_column :users, :instagram, :string, null: false

    add_column :users, :twitter, :string
    change_column :users, :twitter, :string, null: false

    add_column :users, :line, :string
    change_column :users, :line, :string, null: false
  end
end
