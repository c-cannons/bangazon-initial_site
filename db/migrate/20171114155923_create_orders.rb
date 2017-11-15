class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :customer, index:true, foreign_key:true, null:false
      t.references :payment_method, index:true, foreign_key:true, null:false
      t.timestamps
    end
  end
end
