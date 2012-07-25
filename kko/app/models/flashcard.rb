class Flashcard < ActiveRecord::Base
	attr_accessible :title, :desc
	
	has_many :vocabularies
end
