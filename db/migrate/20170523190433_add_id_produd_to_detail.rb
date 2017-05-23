class AddIdProdudToDetail < ActiveRecord::Migration
  def change
    add_column :details, :product_id, :integer
    add_column :details, :receipt_id, :integer
  end
end
