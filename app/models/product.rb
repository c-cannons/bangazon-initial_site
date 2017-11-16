class Product < ApplicationRecord
    has_many :order_details
    has_many :orders, through: :order_details
    
    validates_presence_of :customer_id, :product_type_id, :product_name, :product_price, :product_desc

    def self.fuzzy_name_search(search_string)
        search_string = "%" + search_string + "%"
        self.where("product_name LIKE ?", search_string)
    end

    def self.fuzzy_location_search(search_string)
        search_string = "%" + search_string + "%"
        self.where("product_location LIKE ?", search_string)
    end
end
