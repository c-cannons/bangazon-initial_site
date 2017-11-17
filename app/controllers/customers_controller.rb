class CustomersController < ApplicationController
    # before_action :require_login

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            session[:customer_id] = @customer.id
            @new_order = Order.create!(:customer_id => @customer.id, :payment_method_id => nil)
            session[:order_id] = @new_order.id
            redirect_to root_url, notice: 'Thank you for signing up!'
        else
            render :new
        end
    end

    def edit
        @customer = Customer.find(session[:customer_id])
    end

    def show
        @customer = Customer.find(session[:customer_id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to @customer
        else
            render 'edit'
        end
    end

    private

        def customer_params
            params.require(:customer).permit(:email, :password, :password_confirmation, :customer_first_name, :customer_last_name, :street_address, :city, :state, :zip, :phone_number)
        end

end
