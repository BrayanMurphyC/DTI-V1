class Articulo < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :cover_article, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :cover_article, styles: { :medium => "900x600#" }
  validates_attachment_content_type :cover_article, :content_type => /\Aimage\/.*\Z/

  before_save :numero_visitas


  def update_visitas
    self.update(visitas: self.visitas + 1)
  end



  private

  def numero_visitas
    self.visitas ||= 0
  end

end
