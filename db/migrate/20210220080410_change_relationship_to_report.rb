class ChangeRelationshipToReport < ActiveRecord::Migration[5.2]
  def change
    rename_table :relationships, :report
  end
end
