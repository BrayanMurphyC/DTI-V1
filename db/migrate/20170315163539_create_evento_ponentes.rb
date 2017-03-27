class CreateEventoPonentes < ActiveRecord::Migration[5.0]
  def change
    create_table :evento_ponentes do |t|
      t.string :tema
      t.integer :rate
      t.integer :ponente_id
      t.integer :event_id

      t.timestamps
    end
  end
end
