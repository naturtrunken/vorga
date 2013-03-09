class Log < ActiveRecord::Base
	attr_accessible :start, :end, :direction
	
	belongs_to :flashcard
	has_many :lognotes, dependent: :destroy
end
