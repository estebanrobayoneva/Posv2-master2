class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :periodicidad
      t.date :fecha_afiliacion
      t.date :fecha_vencimiento
      t.date :fecha_cuota
      t.boolean :estado

      t.timestamps null: false
    end
  end
end
