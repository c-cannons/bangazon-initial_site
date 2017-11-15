module ApplicationHelper
    private
    
    def logged_in?
        @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]  # puts @current_customer
    end
end
