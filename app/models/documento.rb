class Documento < ApplicationRecord
  belongs_to :user
  has_attached_file :archivo
  validates_attachment :archivo, presence: true,
         content_type: {content_type: ['text/plain',
          "application/pdf",
                                        "application/vnd.ms-excel",
                                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                        "application/msword",
                                        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]},
                         size: {less_than: 2.megabytes}
end
