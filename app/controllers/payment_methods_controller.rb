class PaymentMethodsController < ApplicationController

    def create
        @payment_method = PaymentMethod.new(payment_method_params)
        @payment_method.save
    end

    private
        def payment_method_params
            params.require(:payment_method).permit(:payment_method_name, :account_number, :customer_id)
        end

end
