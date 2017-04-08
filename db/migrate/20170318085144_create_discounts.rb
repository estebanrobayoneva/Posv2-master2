class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :porcentaje_descuento, :limit => 8

      t.timestamps null: false
    end
  end
end
