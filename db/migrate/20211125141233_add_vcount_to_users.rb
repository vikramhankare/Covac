class AddVcountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :vcount, :string
  end
end
