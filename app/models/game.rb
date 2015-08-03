class Game < ActiveRecord::Base
	
	def self.check_for_update
		game = Game.first
		current_month = Time.now.strftime("%m")

		if current_month != game.current_month
			Champ.update_champs
			game.update(current_month: current_month)
			game.save!
		end
	end


end