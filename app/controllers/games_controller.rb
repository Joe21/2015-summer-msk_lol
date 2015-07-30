class GamesController < ApplicationController

	def index
		# Monthly Check for new champs without having to schedule server worker
		game = Game.first
		current_month = Time.now.strftime("%m")

		if current_month != game.current_month
			Champ.update_champs
		end
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end