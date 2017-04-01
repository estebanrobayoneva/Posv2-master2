class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :porcentaje_descuento

      t.timestamps null: false
    end
  end
end
