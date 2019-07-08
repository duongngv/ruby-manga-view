class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :thumb
      t.boolean :finished
      t.integer :views

      t.timestamps
    end
  end
end
