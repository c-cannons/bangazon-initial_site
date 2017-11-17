class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :payment_method, optional: true
    has_many :order_details
    has_many :products, through: :order_details

    validates_presence_of :customer_id

end
