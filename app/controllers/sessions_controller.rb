class SessionsController < ApplicationController

    def index

    end

    def new
    end

    def create
      customer = Customer.find_by(email: params[:email])
      if customer && customer.authenticate(params[:password])
        session[:customer_id] = customer.id

        order = Order.find_by(customer_id: customer.id, payment_method: nil)
        if order
          session[:order_id] = order.id
        else
          @new_order = Order.create!(:customer_id => customer.id, :payment_method_id => nil)
          get_new_order = Order.find_by(customer_id: customer.id, payment_method: nil)
          session[:order_id] = get_new_order.id
        end
        redirect_to root_url, notice: 'Thank you for logging in!'
      else
        flash.now.notice = 'Email or password is invalid'
        render :new
      end
    end

    def destroy
      session[:customer_id] = nil
      redirect_to root_url, notice: 'Logged out! Buy something next time.'
    end
end
