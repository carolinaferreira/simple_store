class ProductsController < ApplicationController
    def index
        @products = Product.order(name: :asc).limit 6
        @product_with_disccount = Product.order(:cost).limit 1
    end

    def create
        values = params.require(:product).permit(:name, :description, :cost, :quantity)
        @product = Product.new values
        if @product.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        Product.destroy id
        redirect_to root_url
    end

    def search
        @name = params[:name]
        @products= Product.where "name like ?", "%#{@name}%"
    end

    def new
        @product = Product.new
    end
end
