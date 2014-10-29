class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :name
      t.integer  "wiki_id"
      t.integer  "user_id"
      t.timestamps
    end
    add_index :collaborators, :wiki_id
  end
end
