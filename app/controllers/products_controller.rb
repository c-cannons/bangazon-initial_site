class ProductsController < ApplicationController
    rescue_from SQLite3::ConstraintException, :with => :cannot_delete

    def index
        @products = Product.all
    end 

    def new
        @product = Product.new
    end

    def search
        @search = params[:search_string]
        if params[:search_by_name]
            @products = Product.fuzzy_name_search(@search)
        else
            @products = Product.fuzzy_location_search(@search)
        end
        render 'products/search'
    end

    def create
        regex = curses
        @product = Product.new(product_params)
        if @product.product_name.match(regex)&&@product.product_desc.match(regex)
            flash.now[:notice] = "Your product name and description must be free of profanity." 
            render 'new'
        elsif @product.product_name.match(regex)
            flash.now[:notice] = "Your product name must be free of profanity." 
            render 'new'
        elsif @product.product_desc.match(regex)
            flash.now[:notice] = "Your product description must be free of profanity." 
            render 'new'
        else
            if @product.save
                redirect_to @product
            else
                render 'new'
            end
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
        flash[:notice] = "Product deleted."
    end

    private

        def product_params
            params.require(:product).permit(:customer_id, :product_type_id, :product_name, :product_price, :product_desc, :quantity, :product_location, :avatar)
        end

        def cannot_delete
            redirect_to products_path
            flash[:notice] = 'This product is part of an order and cannot be deleted.'
        end

        def curses
            regexArray = [/([Ss]hit(, )?)+/,/([Pp]iss(, )?)+/, /([Ff]uck(, )?)+/, /([Cc]unt(, )?)+/, /([Cc]ocksucker(, )?)+/, /([Mm]otherfucker(, )?)+/, /([Tt]its(, )?)+/, /([Aa]ss(, )?)+/, /([Tt]wat(, )?)+/]
            return Regexp.union(regexArray)
        end
end
