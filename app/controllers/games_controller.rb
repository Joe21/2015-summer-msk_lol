class GamesController < ApplicationController

	def index
		# Monthly Check for new champs without having to schedule server worker
		game = Game.first
		current_month = Time.now.strftime("%m")

		if current_month != game.current_month
			Champ.update_champs
		end

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
	end

end