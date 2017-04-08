class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :tipo_documento
      t.integer :numero_documento , :limit => 8
      t.text :nombre
      t.text :apellido
      t.text :correo
      t.text :direccion
      t.integer :telefono, :limit => 8

      t.timestamps null: false
    end
  end
end
