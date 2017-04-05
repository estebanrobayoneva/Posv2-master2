class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :nit, :limit => 8
      t.string :nombre
      t.integer :telefono, :limit => 8
      t.text :direccion

      t.timestamps null: false
    end
  end
end
