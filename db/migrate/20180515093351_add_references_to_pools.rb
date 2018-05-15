class AddReferencesToPools < ActiveRecord::Migration[5.2]
  def change
    add_reference :pools, :user, foreign_key: true
  end
end
