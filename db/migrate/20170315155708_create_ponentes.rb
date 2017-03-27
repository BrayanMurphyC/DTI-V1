class CreatePonentes < ActiveRecord::Migration[5.0]
  def change
    create_table :ponentes do |t|
      t.string :dni
      t.string :nombres
      t.string :correo
      t.string :telefono
      t.text :bio
      t.text :tags, array: true, default: []
      t.timestamps
    end
  end
end
