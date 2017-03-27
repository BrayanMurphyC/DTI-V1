class AddDniToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :dni, :string
  end
end
