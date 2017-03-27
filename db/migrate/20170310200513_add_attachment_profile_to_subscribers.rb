class AddAttachmentProfileToSubscribers < ActiveRecord::Migration
  def self.up
    change_table :subscribers do |t|
      t.attachment :profile
    end
  end

  def self.down
    remove_attachment :subscribers, :profile
  end
end
