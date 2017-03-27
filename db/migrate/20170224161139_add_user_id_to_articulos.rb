class AddUserIdToArticulos < ActiveRecord::Migration[5.0]
  def change
    add_column :articulos, :user_id, :integer
  end
end
