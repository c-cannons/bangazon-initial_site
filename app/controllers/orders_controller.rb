class OrdersController < ApplicationController

    def index
        @orders = Order.all
        @orders_by_current_customer = Order.where({customer_id: session[:customer_id]})
    end

    def show
        @order = Order.find(params[:id])
    end

    def create
        @order = Order.new(order_params)
        @order.save
    end

    def destroy
    end

    def apply_payment
        @order_to_close = Order.find(session[:order_id])
        @order_to_close.update_attribute(:payment_method_id, params[:payment_method_id])
        @customer_id = session[:customer_id]
        @new_order = Order.create!(:customer_id => @customer_id, :payment_method_id => nil)
        get_new_order = Order.find_by(customer_id: @customer_id, payment_method: nil)
        session[:order_id] = get_new_order.id

        redirect_to order_thanks_path
    end

    def order_thanks
    end

    private
        def order_params
            params.require(:order).permit(:customer_id, :payment_method_id)
        end
end
