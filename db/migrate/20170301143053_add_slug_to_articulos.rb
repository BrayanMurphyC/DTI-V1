class AddSlugToArticulos < ActiveRecord::Migration[5.0]
  def change
    add_column :articulos, :slug, :string
    add_index :articulos, :slug, unique: true
  end
end
