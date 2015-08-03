class GamesController < ApplicationController

	def index
		# Check if new month. If so, will run Champ.update_champs
		Game.check_for_update

		# Instance variables
		@champs_marry_leaders = Champ.marry_leaders
		@champs_sleep_leaders = Champ.sleep_leaders
		@champs_kill_leaders = Champ.kill_leaders

		# Use pluck to create matches, faster query, less taxing on DB
		# @bla = Champ.all.pluck(:riot_id)
		# p '============='
		# @bla.each do |x|
		# 	p x
		# end
		# p '============='


	end

	def scoreboard
	end

	def play
		@bla = Round.generate_champs
	end

end