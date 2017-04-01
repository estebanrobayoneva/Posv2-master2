class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :tipo_documento
      t.integer :numero_documento
      t.text :nombre
      t.text :apellido
      t.text :correo
      t.text :direccion
      t.integer :telefono

      t.timestamps null: false
    end
  end
end
