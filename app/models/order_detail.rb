class OrderDetail < ApplicationRecord

  belongs_to :order
  has_one :product

  validates_presence_of :product_id, :order_id

end
