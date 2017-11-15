class ProductsController < ApplicationController

    def index
        @products = Product.where(customer_id: session[:customer_id])
    end
    
    def new
        @product = Product.new
    end

    def create
        
        @product = Product.new(product_params)
        # @product[:customer_id] = @current_user
        if @product.save
            redirect_to @product
        else
            render 'new'
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    private
        def product_params
            params.require(:product).permit(:customer_id, :product_type_id, :product_name, :product_price, :product_desc, :quantity, :product_location)
        end

end
