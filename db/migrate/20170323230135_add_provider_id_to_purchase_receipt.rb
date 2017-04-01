class AddProviderIdToPurchaseReceipt < ActiveRecord::Migration
  def change
    add_column :purchase_receipts, :provider_id, :integer
  end
end
