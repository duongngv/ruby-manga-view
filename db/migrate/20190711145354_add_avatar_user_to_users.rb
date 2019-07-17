class AddAvatarUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_user, :string
  end
end
