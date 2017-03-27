class CreateArticulos < ActiveRecord::Migration[5.0]
  def change
    create_table :articulos do |t|
      t.string :title
      t.text :body
      t.string :tags

      t.timestamps
    end
  end
end
