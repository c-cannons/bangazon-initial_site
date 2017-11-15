class OrderDetailsController < ApplicationController

    def index
        @order_details = OrderDetail.all
    end

    def create
        @order_detail = OrderDetail.new(order_detail_params)
        @order_detail.save
    end

    private
        def order_detail_params
            params.require(:order_detail).permit(:order_id, :product_id)
        end
end
