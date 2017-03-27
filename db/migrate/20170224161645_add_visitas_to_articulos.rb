class AddVisitasToArticulos < ActiveRecord::Migration[5.0]
  def change
    add_column :articulos, :visitas, :integer
  end
end
