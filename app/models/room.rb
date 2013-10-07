class Room < ActiveRecord::Base
  has_and_belongs_to_many :products

	validates :name, uniqueness: true, presence: true

	attr_accessible :name, :description
end