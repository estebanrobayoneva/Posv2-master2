class AddFechaNacimientoToClient < ActiveRecord::Migration
  def change
    add_column :clients, :fecha_nacimiento, :date
  end
end
