class SessionsController < ApplicationController
    def new
    end
  
    def create
      customer = Customer.find_by(email: params[:email])
      if customer && customer.authenticate(params[:password])
        session[:customer_id] = customer.id
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
