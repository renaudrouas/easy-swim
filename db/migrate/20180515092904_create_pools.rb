class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.string :dimensions
      t.string :description
      t.string :pictures
      t.integer :price

      t.timestamps
    end
  end
end
