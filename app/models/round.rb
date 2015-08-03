class Round < ActiveRecord::Base
	has_many :matchmakers
	has_many :champs, through: :matchmakers

	def initialize_participants
		# Use pluck to efficiently return array of all champ ID's
		available_champs = Champ.all.pluck(:id)

		# Remove random champ from available_champs and add that instance to Round.champs relation
		9.times do
			selected_champ = Champ.find(available_champs.shuffle!.pop)
			self.champs << selected_champ
		end
	end




end
