class Banner < ApplicationRecord
  belongs_to :category
  has_many :recommends, :dependent => :destroy

  has_attached_file :image, styles: { banner: "160x40"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  after_save :recommend_new

  private

  def recommend_new
  	Recommend.create(code: "", banner_id: id)
  end
# 12월 01일이 되는 순간 계절 DB에 + 1년해주기
end