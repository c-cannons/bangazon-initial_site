class PaymentMethod < ApplicationRecord

    def create
        
    end

    private
        def payment_method_params
            params.require(:payment_method).permit(:payment_method_name, :account_number, :customer_id)
        end
end
