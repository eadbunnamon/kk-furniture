# encoding: UTF-8
class Room < ActiveRecord::Base
  has_and_belongs_to_many :products
  mount_uploader :photo, PhotoUploader

	validates :name, uniqueness: true, presence: true

	attr_accessible :name, :description, :photo
end