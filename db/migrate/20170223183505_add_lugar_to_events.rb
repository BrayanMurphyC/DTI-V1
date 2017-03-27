class AddLugarToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :lugar, :string
  end
end
