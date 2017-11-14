class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :product, index:true, foreign_key:true, null:false
      t.references :order, index:true, foreign_key:true, null:false
      t.timestamps
    end
  end
end
