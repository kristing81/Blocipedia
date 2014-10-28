class AddUserToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :user_id, :integer
    add_column :wikis, :private, :boolean, default: false
  end
end
