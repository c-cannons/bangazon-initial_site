class CreateProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_types do |t|

      t.string :product_type_name, null: false

      t.timestamps
    end
  end
end
