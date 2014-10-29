class FixRoles < ActiveRecord::Migration
  def change
    create_table :roles, force: true do |t|
      t.string :role
      t.references :wiki, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
