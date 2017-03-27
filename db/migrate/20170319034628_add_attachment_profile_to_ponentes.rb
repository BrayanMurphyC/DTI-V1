class AddAttachmentProfileToPonentes < ActiveRecord::Migration
  def self.up
    change_table :ponentes do |t|
      t.attachment :profile
    end
  end

  def self.down
    remove_attachment :ponentes, :profile
  end
end
