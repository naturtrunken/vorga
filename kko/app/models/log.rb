class Log < ActiveRecord::Base
	attr_accessible :start, :end
	belongs_to :flashcard
	has_many :lognotes
end
