class Lognote < ActiveRecord::Base
	attr_accessible :failed, :vocabulary_id, :direction
	belongs_to :log
end
