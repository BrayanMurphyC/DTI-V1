class AddTagsToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :tags, :text, array: true, default: []
  end
end
