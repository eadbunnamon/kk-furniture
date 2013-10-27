class HomesController < ApplicationController
  def index
    @best_sellers = Product.where(best_seller: true)
    @new_arrivals = Product.order("created_at desc")
    @favorites = Product.order("view desc").limit(6)

    @new_arrival_photo = @new_arrivals.last.photos.first.photo.url if @new_arrivals.present?
    @best_seller_photo = @best_sellers.last.photos.first.photo.url if @best_seller_photo.present?
    @promotion_photo = Promotion.last.file.thumb.url if @promotion_photo.present?
  end

  def newest_products
    @newest_products = Product.where("created_at > ?", Time.now - 30.days)
  end

  def best_sellers
    @best_sellers = Product.where(best_seller: true)
  end

  def promotions
    @promotions = Promotion.all
  end

  def map
    
  end
end