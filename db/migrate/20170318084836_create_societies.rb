class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :nombre
      t.text :descripcio
      t.decimal :valor_anual
      t.decimal :valor_semestral
      t.decimal :valor_mensual

      t.timestamps null: false
    end
  end
end
