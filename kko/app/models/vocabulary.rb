class Vocabulary < ActiveRecord::Base

	belongs_to :flashcard
	has_many :category
end
