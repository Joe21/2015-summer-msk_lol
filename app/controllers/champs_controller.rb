class ChampsController < ApplicationController

	def update
		p "========"
		p "update"
		p "========"
	end

	# Strong params
	private
	def champ_params
		params.require(:champ).permit(:appearance_count, :marry_count, :sleep_count, :kill_count)
	end

end