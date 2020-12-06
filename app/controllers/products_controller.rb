class ProductsController < ApplicationController
    def index
        @products = Product.order :name
        @product_with_disccount = Product.order(:cost).limit 1
    end
end
