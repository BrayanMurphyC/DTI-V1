class AddAsistenciaToRegistroEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_eventos, :asistencia, :boolean, :default => false
  end
end
