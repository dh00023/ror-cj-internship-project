class CreateRecommends < ActiveRecord::Migration[5.1]
  def change
    create_table :recommends do |t|
      t.string :code
      t.references :banner, foreign_key: true

      t.timestamps
    end
  end
end
