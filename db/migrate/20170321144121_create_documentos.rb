class CreateDocumentos < ActiveRecord::Migration[5.0]
  def change
    create_table :documentos do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :user_id

      t.timestamps
    end
  end
end
