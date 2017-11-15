class OrderDetail < ApplicationRecord

    validates_presence_of :product_id, :order_id
end
