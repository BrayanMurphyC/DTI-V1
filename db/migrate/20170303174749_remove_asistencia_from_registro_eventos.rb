class RemoveAsistenciaFromRegistroEventos < ActiveRecord::Migration[5.0]
  def change
    remove_column :registro_eventos, :asistencia, :boolean
  end
end
