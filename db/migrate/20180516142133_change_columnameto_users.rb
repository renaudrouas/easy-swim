class ChangeColumnametoUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Avatar, :avatar
  end
end
