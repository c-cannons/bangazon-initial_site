class HomeController < ApplicationController
    def index
        @products = Product.all.last(20).reverse
    end

   
    
end
