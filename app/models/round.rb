class Round < ActiveRecord::Base
	has_many :matchmakers
	has_many :champs, through: :matchmakers
end
