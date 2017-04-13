class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :nombre
      t.integer :numero_sesiones
      t.integer :valor_sesion
      t.integer :valor_total_curso

      t.timestamps null: false
    end
  end
end
