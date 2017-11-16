class Product < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    has_many :orders, through: :order_details
    
    has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_presence_of :customer_id, :product_type_id, :product_name, :product_price, :product_desc
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    def self.fuzzy_name_search(search_string)
        search_string = "%" + search_string + "%"
        self.where("product_name LIKE ?", search_string)
    end

    def self.fuzzy_location_search(search_string)
        search_string = "%" + search_string + "%"
        self.where("product_location LIKE ?", search_string)
    end
<<<<<<< HEAD


=======
>>>>>>> 12c53f06f353bc29fd9b003adcf4bfae98b5f92e
end
