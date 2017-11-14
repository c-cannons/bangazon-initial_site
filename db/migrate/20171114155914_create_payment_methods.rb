class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.string :payment_method_name, null:false
      t.string :account_number, null:false
      t.references :customer, index:true, foreign_key:true, null:false
      
      t.timestamps
    end
  end
end
