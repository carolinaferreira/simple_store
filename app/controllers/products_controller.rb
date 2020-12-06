class ProductsController < ApplicationController
    def index
        @products = Product.order :name
        @product_with_disccount = Product.order(:cost).limit 1
    end

    def create
        product = params.require(:product).permit(:name, :description, :cost, :quantity)
        Product.create product
        redirect_to root_url
    end

    def destroy
        id = params[:id]
        Product.destroy id
        redirect_to root_url
    end
end
