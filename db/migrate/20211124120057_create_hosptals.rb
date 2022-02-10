class CreateHosptals < ActiveRecord::Migration[6.1]
  def change
    create_table :hosptals do |t|
      t.string :hospital_id
      t.string :hospital_name
      t.string :address
      t.string :phone_no
      t.string :pin_code
      t.integer :free_vac
      t.integer :paid_vac

      t.timestamps
    end
  end
end
