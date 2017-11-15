class ProductTypesController < ApplicationController

    def index
        @product_types = ProductType.all
        @products_by_type = Hash.new
        @product_types.each do |prod|
            @products_by_type[prod[:id]] = Product.where(product_type_id: prod[:id])
        end
    end

    def show
        @product_type = ProductType.find(params[:id])
        @products = Product.where(product_type_id: @product_type[:id])
        p @products
    end

    # This is only used for the faker gem
    def create
        @product_type = ProductType.new(product_type_params)
        @product_type.save
    end

    private
        def product_type_params
            params.require(:product_type).permit(:product_type_name)
        end

end
