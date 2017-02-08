class AddDatetimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime

    remove_column :users, :joined 
  end
end
