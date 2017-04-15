class AddTipoProductoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tipo_producto, :integer
  end
end
