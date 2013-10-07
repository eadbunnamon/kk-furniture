class Product < ActiveRecord::Base
	belongs_to :category
	has_and_belongs_to_many :rooms

	validates :name, presence: true
	validates :price, presence: true

	attr_accessible :name, :price, :detail, :description, :best_seller, :category_id, :room_id
end