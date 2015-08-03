class GamesController < ApplicationController

	def index
		# Check if new month. If so, will run Champ.update_champs
		Game.check_for_update

		# Instance variables
		@champs_marry_leaders = Champ.marry_leaders
		@champs_sleep_leaders = Champ.sleep_leaders
		@champs_kill_leaders = Champ.kill_leaders
	end

	def scoreboard
	end

	def play
		new_round = Round.new()
		# Randomly select 9 champs
		new_round.initialize_participants

		# Convert to array
		array_of_champs = new_round.champs.map { |champ| champ }
		
		# Return hash of selected champs split into 3 matches 
		@data = new_round.split_into_matches(array_of_champs)
	end

end