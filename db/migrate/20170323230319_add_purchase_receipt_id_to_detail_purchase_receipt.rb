class AddPurchaseReceiptIdToDetailPurchaseReceipt < ActiveRecord::Migration
  def change
    add_column :detail_purchase_receipts, :purchase_receipt_id, :integer
  end
end
