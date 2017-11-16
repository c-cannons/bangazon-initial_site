class Product < ApplicationRecord

    has_many :order_details
    has_many :orders, through: :order_details

    validates_presence_of :customer_id, :product_type_id, :product_name, :product_price, :product_desc

end
