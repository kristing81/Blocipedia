class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :invoice_id
      t.string   "email"
      t.datetime "created_at"
      t.string   "stripe_customer_token"

      t.timestamps
    end
  end
end
