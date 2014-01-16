# encoding: UTF-8
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
      @product_ids = Product.order("created_at desc").limit(30).map(&:id)
      @newest_products = true
    elsif params[:favorite].present?
      @product_ids = Product.order("view DESC").map(&:id)
      @favorite = true
    else
      @product_ids = Product.all.map(&:id)
    end      
    
    current_index = @product_ids.index(@product.id)
    current_id = @product_ids[current_index]
    @next_id = current_id == @product_ids.last ? current_id : @product_ids[current_index + 1]
    @prev_id = current_id == @product_ids.first ? current_id : @product_ids[current_index - 1]
  end

  def search
    keywords = params[:keywords].downcase.split(/\s/)
    @original_keywords = params[:keywords]

    result = {}
    product_conditions = []
    room_conditions = []
    category_conditions = []

    keywords.each do |keyword|
      product_conditions << "LOWER(products.name) LIKE '%#{keyword}%'"
      product_conditions << "LOWER(products.detail) LIKE '%#{keyword}%'"
      product_conditions << "LOWER(products.description) LIKE '%#{keyword}%'"
      product_conditions << "LOWER(products.price) LIKE '%#{keyword}%'"

      room_conditions << "LOWER(rooms.name) LIKE '%#{keyword}%'"
      room_conditions << "LOWER(rooms.description) LIKE '%#{keyword}%'"

      category_conditions << "LOWER(categories.name) LIKE '%#{keyword}%'"
      category_conditions << "LOWER(categories.description) LIKE '%#{keyword}%'"
    end

    @products = Product.where(product_conditions.join(" OR "))

    products_from_categories = Category.where(category_conditions.join(" OR ")).map(&:products)
    products_from_rooms = Room.where(room_conditions.join(" OR ")).map(&:products)

    (products_from_categories | products_from_rooms).each do |products_array|
      @products << products_array
    end

    @products = @products.uniq
  end
end