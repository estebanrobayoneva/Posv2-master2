class AddProductIdToDetailPurchaseReceipt < ActiveRecord::Migration
  def change
    add_column :detail_purchase_receipts, :product_id, :integer
  end
end
