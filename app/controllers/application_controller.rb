class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_menu
  before_filter :load_sitemap

  def load_menu
    @menu_categories = Category.all
    @menu_rooms = Room.all
  end

  def load_sitemap
    @sitemap = {
      "Featured Products" => [
        "New Arrivals",
        "Hot Prices",
        "Best Selling",
        "Most Favorite"
      ],
      "Interior Solution" => [
        "Lifestyle Interior Designer",
        "Built-in Specialist",
        "Interior Home Solution",
        "Interior @Home"
      ],
      "Media Center" => [
        "Download Catalog",
        "TVCs",
        "Home & Lifestyle"
      ],
      "Customer Services" => [
        "Services",
        "Warranty",
        "FAQs",
        "Care Instruction",
        "Shipping Policy"
      ],
      "Tools" => [
        "Advanced Search",
        "Shopping Guide"
      ],
      "Wellsave Living Inspired" => [
        "Desire to Inspired",
        "Room Styling"
      ],
      "About Us" => [
        "Wellsave Furniture"
      ],
      "Customized Series" => [],
      "Exclusive Brands" => [],
      "Contact Us" => []
    }
  end
end
