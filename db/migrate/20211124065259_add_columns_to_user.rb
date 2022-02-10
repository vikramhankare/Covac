class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :vaccine_status, :string
    add_column :users, :aadhaar, :string
    add_column :users, :email_id, :string
    add_column :users, :phone_no, :string
    add_column :users, :address, :string
    add_column :users, :pin_code, :string
  end
end
