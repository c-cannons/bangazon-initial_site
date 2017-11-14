class Product < ApplicationRecord
    
    validates :customer_id, presence: true
    validates :product_type_id, presence: true
    validates :product_name, presence: true
    validates :product_price, presence: true
    validates :product_desc, presence: true

end
