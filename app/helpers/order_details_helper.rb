module OrderDetailsHelper

    def product_available?(product)
        selling_product = Product.find(product[:id])
        if selling_product[:quantity] >= product[:quantity]
            true
        else
            false
        end
    end

    def get_quantity_to_update_to(product)
        selling_product = Product.find(product[:id])
        selling_product[:quantity] - product[:quantity]
    end

    def update_quantity(product)
        selling_product = Product.find(product[:id])
        new_quant = selling_product[:quantity] - product[:quantity]
        product.update_attribute(:quantity, new_quant)
    end

end
