class PaymentMethod < ApplicationRecord
    validates_presence_of :payment_method_name, :account_number, :customer_id

end
