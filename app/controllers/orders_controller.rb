class OrdersController < ApplicationController

    def index
        # @orders = Order.where("customer_id = '1' AND payment_method_id = '0'" )
        @shopping_cart = Product.joins(:orders).where("orders.customer_id = '1'")
    end

    def create
        @order = Order.new(order_params)
        @order.save
    end

    private
        def order_params
            params.require(:order).permit(:customer_id, :payment_method_id)
        end
end
