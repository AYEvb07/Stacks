class AddGhUserToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gh_user_name, :string
  end
end
