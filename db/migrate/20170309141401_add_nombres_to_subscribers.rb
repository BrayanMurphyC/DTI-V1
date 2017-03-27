class AddNombresToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :nombres, :string
  end
end
