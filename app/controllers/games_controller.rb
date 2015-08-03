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
		new_round.initialize_participants

		@participants = new_round.champs

	end

end