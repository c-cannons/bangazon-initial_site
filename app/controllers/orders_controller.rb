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

    private
        def order_params
            params.require(:order).permit(:customer_id, :payment_method_id)
        end
end
