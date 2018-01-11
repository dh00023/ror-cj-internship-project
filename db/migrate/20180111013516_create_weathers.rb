class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.string :location
      t.float :lat
      t.float :lon
      t.integer :choose

      t.timestamps
    end
  end
end
