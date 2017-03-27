class EventoPonente < ApplicationRecord
  validates :tema, presence: true
  belongs_to :event
  belongs_to :ponente
end
