class Matchmaker < ActiveRecord::Base
	belongs_to :champ
	belongs_to :round
end
