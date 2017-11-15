class Product < ApplicationRecord
    
    validates_presence_of :customer_id, :product_type_id, :product_name, :product_price, :product_desc

end
