class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email, null:false
      t.string :password, null:false
      t.string :customer_first_name, null:false
      t.string :customer_last_name, null:false
      t.string :street_address, null:false
      t.string :city, null:false
      t.string :zip, null:false
      t.string :phone_number, null:false

      t.timestamps
    end
  end
end
