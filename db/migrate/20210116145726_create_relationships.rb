class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :violator, foreign_key: { to_table: :users }
      t.references :reporter, foreign_key: { to_table: :users }

      t.timestamps

      t.index [:violator_id, :reporter_id], unique: true
    end
  end
end
