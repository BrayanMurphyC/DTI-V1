class RemoveTagsFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :tags, :string
  end
end
