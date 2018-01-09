class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end
end
