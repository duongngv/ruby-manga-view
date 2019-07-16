class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :thumb
      t.date :publish_date
      t.integer :views, default: 0
      t.integer :status, default: 0
      t.integer :category_id

      t.timestamps
    end
  end
end
