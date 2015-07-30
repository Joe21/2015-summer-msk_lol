class GamesController < ApplicationController

	def index
		game = Game.first
		current_month = Time.now.strftime("%m")

		if current_month != game.current_month
			p "check to update new champs list"
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