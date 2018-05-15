class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :First_Name, :string
    add_column :users, :Last_Name, :string
    add_column :users, :Address, :string
    add_column :users, :Phone_Number, :string
    add_column :users, :Avatar, :string
  end
end
