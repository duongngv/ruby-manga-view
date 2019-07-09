class CreateComicCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_categories do |t|
      t.integer :manga_id
      t.integer :category_id

      t.timestamps
    end
  end
end
