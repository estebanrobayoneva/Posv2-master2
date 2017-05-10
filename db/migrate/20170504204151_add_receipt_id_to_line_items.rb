class AddReceiptIdToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :receipt_id, :integer
  end
end
