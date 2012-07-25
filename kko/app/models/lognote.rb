class Lognote < ActiveRecord::Base
	attr_accessible :failed, :vocabulary_id
	belongs_to :log
end
