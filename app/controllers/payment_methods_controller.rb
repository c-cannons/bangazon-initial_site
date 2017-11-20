class PaymentMethodsController < ApplicationController

    def new
        @payment_method = PaymentMethod.new
    end

    def index
        @payment_methods = PaymentMethod.where(customer_id: session[:customer_id])
    end

    def create
        @payment_method = PaymentMethod.new(payment_method_params)

        if @payment_method.save
            redirect_to payment_methods_path
        else
            render :new
        end
    end

    def destroy
        @payment_method = PaymentMethod.find(params[:id])
        @payment_method.destroy
        redirect_to payment_methods_path
    end

    def close_order
      @payment_methods = PaymentMethod.where(customer_id: session[:customer_id])
    end

    private

        def payment_method_params
            params.require(:payment_method).permit(:payment_method_name, :account_number, :customer_id)
        end

end
