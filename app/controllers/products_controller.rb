class ProductsController < ApplicationController

  def show
  	@product = Product.find(params[:id])
    @product.view = @product.view + 1
    @product.save

    if params[:categoryid].present?
      @product_ids = Product.where(category_id: params[:categoryid]).map(&:id) 
      @category_id = params[:categoryid]
    elsif params[:roomid].present?
      @product_ids = Room.find(params[:roomid]).products.map(&:id)
      @room_id = params[:roomid]
    elsif params[:best_sellers].present?
      @product_ids = Product.where(best_seller: true).map(&:id)
      @best_sellers = true
    elsif params[:newest_products].present?
      @product_ids = Product.where("created_at > ?", Time.now - 30.days).map(&:id)
      @newest_products = true
    else
      @product_ids = Product.all.map(&:id)
    end      
    
    current_index = @product_ids.index(@product.id)
    current_id = @product_ids[current_index]
    @next_id = current_id == @product_ids.last ? current_id : @product_ids[current_index + 1]
    @prev_id = current_id == @product_ids.first ? current_id : @product_ids[current_index - 1]
  end
end