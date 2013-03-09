class Flashcard < ActiveRecord::Base
	attr_accessible :title, :desc
	
	belongs_to :language
	has_many :vocabularies, dependent: :destroy
	has_many :logs, dependent: :destroy
end
