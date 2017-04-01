class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.date :fecha
      t.decimal :valor

      t.timestamps null: false
    end
  end
end
