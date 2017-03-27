class AddAttachmentCoverArticleToArticulos < ActiveRecord::Migration
  def self.up
    change_table :articulos do |t|
      t.attachment :cover_article
    end
  end

  def self.down
    remove_attachment :articulos, :cover_article
  end
end
