class AddFengAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :feng_username, :string
    add_column :users, :feng_password, :string
    add_column :users, :feng_url, :string
    add_column :users, :feng_project_id, :integer
  end
end
