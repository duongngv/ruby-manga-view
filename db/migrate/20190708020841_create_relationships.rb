class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :comic_id
      t.integer :user_id
      t.integer :relationshipable_id
      t.string :relationshipable_type

      t.timestamps
    end
    add_index :relationships, :comic_id
    add_index :relationships, :user_id
    add_index :relationships, [:comic_id, :user_id, :relationshipable_type],
      unique: true, name: :following
  end
end
