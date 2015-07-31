class Round < ActiveRecord::Base

	def self.generate_champs
		available_champs = Champ.all.pluck(:id)
		participants = []
		3.times do |x|
			participants << available_champs.shuffle!.pop
		end

		data = {}
		data['participants'] = participants
		data['available_champs'] = available_champs
		return data
	end

end
