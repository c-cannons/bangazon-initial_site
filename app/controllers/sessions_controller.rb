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
          # new_order.customer_id = session[:customer_id]
          # new_order.payment_method_id = nil
          # @new_order.save
          # order = Order.find_by(customer_id: customer.id, payment_method: nil)
          session[:order_id] = 'No Order'
        end
        # can set order id here
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
