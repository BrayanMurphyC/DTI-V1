class AddCertificadoToRegistroEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :registro_eventos, :certificado, :boolean, :default => false
  end
end
