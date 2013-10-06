class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :room

	validates :name, presence: true
	validates :price, presence: true

	attr_accessible :name, :price, :detail, :description, :best_seller, :category_id, :room_id
end