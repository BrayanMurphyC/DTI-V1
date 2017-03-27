class CreateRegistroEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :registro_eventos do |t|
      t.boolean :certificado
      t.boolean :asistencia
      t.integer :event_id
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
