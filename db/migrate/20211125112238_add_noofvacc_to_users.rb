class AddNoofvaccToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :noofvacc, :integer
  end
end
