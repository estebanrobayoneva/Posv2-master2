class AddSocietyIdToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :society_id, :integer
  end
end
