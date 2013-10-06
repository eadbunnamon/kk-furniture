class Faq < ActiveRecord::Base
	# has_many :products

	attr_accessible :question, :answer
end