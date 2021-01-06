class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.integer :prefecture_id, null: false
      t.string :title, null: false
      t.text :introduction, null: false
      t.string :event_image_id, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
