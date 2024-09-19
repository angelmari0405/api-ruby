class AddUsersToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :users, null: false, foreign_key: true
  end
end
