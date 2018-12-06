class ProductsController < ApplicationController
  before_action :find_category, only: [:create, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.category = @category
    @product.save
    redirect_to @product.category
  end

  def update
    redirect_to @product.category
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to @product.category
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end
