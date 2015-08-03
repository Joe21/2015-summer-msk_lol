class Round < ActiveRecord::Base
	has_many :matchmakers
	has_many :champs, through: :matchmakers

	# Randomly select 9 champions with no repeat
	def initialize_participants
		# Use pluck to efficiently return array of all champ ID's
		available_champs = Champ.all.pluck(:id)

		# Remove random champ from available_champs and add that instance to Round.champs relation
		9.times do
			selected_champ = Champ.find(available_champs.shuffle!.pop)
			self.champs << selected_champ
		end
	end

	def split_into_matches(array)
		data = {}
		data['match1'] = []
		data['match2'] = []
		data['match3'] = []
		3.times do
			data['match1'] << array.shuffle!.pop
			data['match2'] << array.shuffle!.pop
			data['match3'] << array.shuffle!.pop
		end

		return data
	end
end