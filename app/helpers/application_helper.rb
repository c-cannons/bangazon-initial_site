module ApplicationHelper
    private
    
    def logged_in?
        @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]  # puts @current_customer
    end

    def number_of_items_in_cart
        @cart_number = OrderDetail.where({order_id: session[:order_id]})
        return @cart_number.length
    end
    
end
