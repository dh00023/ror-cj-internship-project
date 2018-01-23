class AddDateToBanners < ActiveRecord::Migration[5.1]
  def change
    add_column :banners, :sdate, :datetime
    add_column :banners, :edate, :datetime
  end
end
