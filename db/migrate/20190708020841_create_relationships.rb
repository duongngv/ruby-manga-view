class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :manga_id
      t.integer :user_id
      t.integer :relationshipable_id
      t.string :relationshipable_type

      t.timestamps
    end
    add_index :relationships, :manga_id
    add_index :relationships, :user_id
    add_index :relationships, [:manga_id, :user_id], unique: true
  end
end
