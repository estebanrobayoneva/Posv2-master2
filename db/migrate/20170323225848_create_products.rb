class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.integer :cantidad
      t.decimal :valor_unitario
      t.decimal :valor_total_curso

      t.timestamps null: false
    end
  end
end
