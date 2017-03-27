class Subscriber < ApplicationRecord

  acts_as_voter
  validates :profile, presence: false
  has_attached_file :profile, styles: { :medium => "600x600#" },default_url: "/assets/placeholder_profile.png"
  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/


  has_many :registro_eventos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
