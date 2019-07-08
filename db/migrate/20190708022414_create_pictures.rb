class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :chapter_id
      t.string :picture

      t.timestamps
    end
  end
end
