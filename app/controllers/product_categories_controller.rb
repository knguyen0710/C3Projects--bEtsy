class ProductCategoriesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    ProductCategory.create(product_category_params)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:product_id])
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy

    redirect_to @product
  end

  private

  def product_category_params
    { product_id: params[:product_id], 
      category_id: params[:product_category][:category_id] }
  end
end
