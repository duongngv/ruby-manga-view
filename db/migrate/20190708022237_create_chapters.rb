class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :manga_id
      t.string :name

      t.timestamps
    end
  end
end
