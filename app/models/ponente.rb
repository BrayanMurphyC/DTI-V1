class Ponente < ApplicationRecord
  has_many :evento_ponente

  validates :profile, presence: true
  has_attached_file :profile, styles: { :medium => "600x600#" },default_url: "/assets/placeholder_profile.png"
  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/

end
