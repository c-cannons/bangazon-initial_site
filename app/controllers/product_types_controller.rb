class ProductTypesController < ApplicationController

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
