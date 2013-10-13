class HomesController < ApplicationController
  def index
    @best_sellers = Product.where(best_seller: true)
  end

  def all_furniture
  end
end