class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :nit
      t.string :nombre
      t.integer :telefono
      t.text :direccion

      t.timestamps null: false
    end
  end
end
