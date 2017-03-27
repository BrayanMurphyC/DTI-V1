class RemoveStartFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :start, :date
  end
end
