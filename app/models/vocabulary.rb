class Vocabulary < ActiveRecord::Base
	attr_accessible :name, :translation, :category_id
	
	belongs_to :flashcard
	has_many :category
end
