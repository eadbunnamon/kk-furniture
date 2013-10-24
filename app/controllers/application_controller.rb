class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_menu

  def load_menu
    @menu_categories = Category.all
    @menu_rooms = Room.all
  end
end
