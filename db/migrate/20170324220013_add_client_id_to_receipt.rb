class AddClientIdToReceipt < ActiveRecord::Migration
  def change
    add_column :receipts, :client_id, :integer
  end
end
