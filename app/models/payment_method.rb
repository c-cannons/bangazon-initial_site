class PaymentMethod < ApplicationRecord

    belongs_to :customer

    validates_presence_of :payment_method_name, :account_number, :customer_id

end
