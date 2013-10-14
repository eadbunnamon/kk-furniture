class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_menu

  def load_menu
    @categories = Category.all
    @rooms = Room.all
  end
end
