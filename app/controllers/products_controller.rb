class ProductsController < ApplicationController

    def create
        @product = Product.new(product_params)
        @product.save
    end

    private
        def product_params
            params.require(:product).permit(:customer_id, :product_type_id, :product_name, :product_price, :product_desc, :product_location, :product_picture_file_name, :product_picture_content_type, :product_picture_file_size, :product_picture_updated_at)
        end

end
