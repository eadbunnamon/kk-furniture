class Category < ActiveRecord::Base
	# has_many :products

	validates :name, uniqueness: true, presence: true

	attr_accessible :name, :description
end