class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role
      t.references :wiki_id, index: true
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
