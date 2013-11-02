class Product < ActiveRecord::Base
	belongs_to :category
	has_and_belongs_to_many :rooms
  has_many :photos, dependent: :destroy

  validates :name, presence: true

	attr_accessible :name, :price, :detail, :description, :best_seller, :category_id, :room_id, :rooms, :code
end