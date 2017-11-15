class ProductType < ApplicationRecord

    def get_all_products_by_product_type_id
        return Product.where(id: self.id)
    end

end
