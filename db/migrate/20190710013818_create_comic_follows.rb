class CreateComicFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_follows do |t|

      t.timestamps
    end
  end
end
