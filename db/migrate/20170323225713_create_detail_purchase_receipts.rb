class CreateDetailPurchaseReceipts < ActiveRecord::Migration
  def change
    create_table :detail_purchase_receipts do |t|
      t.integer :cantidad, :limit => 8
      t.decimal :valor_unitario
      t.decimal :valor_final

      t.timestamps null: false
    end
  end
end
