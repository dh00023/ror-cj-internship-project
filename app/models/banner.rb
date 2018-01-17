class Banner < ApplicationRecord
  belongs_to :category
  has_many :recommends, :dependent => :destroy

  has_attached_file :image, styles: { banner: "160x40"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
