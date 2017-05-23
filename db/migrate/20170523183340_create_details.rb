class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :cantidad_producto
      t.decimal :precio

      t.timestamps null: false
    end
  end
end
