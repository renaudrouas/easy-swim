class AddColumnsToPools < ActiveRecord::Migration[5.2]
  def change
    add_column :pools, :title, :string
    add_column :pools, :address, :string
  end
end
