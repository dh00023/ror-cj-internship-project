class Banner < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { medium: "102x43>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
