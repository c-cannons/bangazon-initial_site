class Customer < ApplicationRecord
    has_secure_password
    
    validates_uniqueness_of :email
    validates_presence_of :customer_first_name, :customer_last_name, :customer_last_name,:street_address,:city,:state,:zip,:phone_number
end
