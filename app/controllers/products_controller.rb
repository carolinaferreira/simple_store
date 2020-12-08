class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy]

    def index
        @products = Product.order(name: :asc).limit 6
        @product_with_disccount = Product.order(:cost).limit 1
    end

    def create
        @product = Product.new product_params
        if @product.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_url
        else
            to_render :new
        end
    end

    def destroy
        @product.destroy
        redirect_to root_url
    end

    def new
        @product = Product.new
        @departments = Department.all
    end
    
    def edit
        to_render :edit
    end
    
    def update
        if @product.update product_params
            flash[:notice]= "Produto atualizado com sucesso!"
            redirect_to root_url
        else
            to_render :edit
        end
    end
    
    def search
        @name = params[:name]
        @products= Product.where "name like ?", "%#{@name}%"
    end

    def product_params
        params.require(:product)
        .permit(:name, :description, :cost, :quantity, :department_id)
    end

    def set_product
        @product = Product.find(params[:id])
    end

    def to_render(view)
        @departments = Department.all
        render view
    end
end
