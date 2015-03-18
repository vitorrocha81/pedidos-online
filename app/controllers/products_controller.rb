class ProductsController < ApplicationController
 before_action :authenticate_company_admin!, only: [:create, :new, :edit, :update]

  def index
    @products = Product.all.order(created_at: :desc).limit(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.company = current_company_admin.company
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'new'
    end
  end

private
  def product_params
    params.require(:product).permit(:title, :price, :description, :product_img, :product_category_id)
  end
end
