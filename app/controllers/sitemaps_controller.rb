class SitemapsController < ApplicationController

  def index
    @categories = Category.all
    @promotions = Promotion.where("ends_at > ?", Time.now - 30.days)
  end
end