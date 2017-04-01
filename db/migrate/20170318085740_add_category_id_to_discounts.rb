class AddCategoryIdToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :category_id, :integer
  end
end
