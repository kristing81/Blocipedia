class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices, force: true do |t|
      t.integer :user_id
      t.integer :amount
      t.string :description
      t.timestamps
    end
  end
end
