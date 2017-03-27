class RemoveCertificadoFromRegistroEventos < ActiveRecord::Migration[5.0]
  def change
    remove_column :registro_eventos, :certificado, :boolean
  end
end
