class ChangeColumnamestoUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :First_Name, :first_name
    rename_column :users, :Last_Name, :last_name
    rename_column :users, :Address, :address
    rename_column :users, :Phone_Number, :phone_number
  end
end
