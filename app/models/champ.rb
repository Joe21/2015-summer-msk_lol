class Champ < ActiveRecord::Base
	validates :name, presence: true
	validates :riot_id, presence: true
	validates :img_url, presence: true
	
	has_many :matchmakers
	has_many :rounds, through: :matchmakers

	# Handle Scoreboard Queries
	def self.marry_leaders
		return Champ.order("marry_count DESC").limit(10)
	end

	def self.sleep_leaders
		return Champ.order("sleep_count DESC").limit(10)
	end

	def self.kill_leaders
		return Champ.order("kill_count DESC").limit(10)
	end

	# ================================================ 
	# Instance Methods to handle champ db maintanence
	# ================================================ 

	# Method used in seed.rb
	def self.initial_seed
		riot_api_call['data'].each do |key, value|
			image_path = "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/" + key + "_0.jpg"
			Champ.create(name: key, riot_id: value["id"], img_url: image_path)
		end
	end

	# Makes the riot api call, refer to API documentation at the very bottom
	def self.riot_api_call
		request = "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=" + ENV['RIOT_KEY']
		response = HTTParty.get(request)
		response_to_json = JSON.parse(response.body)

		return response_to_json
	end

	# If champ name doesn't exist in DB, create it
	def self.update_champs
		riot_api_call['data'].each do |key, value|
			if !Champ.exists?(name: key)
				image_path = "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/" + key + "_0.jpg"
				Champ.create(name: key, riot_id: value["id"], img_url: image_path)
			end
		end
	end

	# =============================
	# RIOT API DOC
	# =============================
	# /api/lol/static-data/{region}/v1.2/champion
	# Riot Documentation: https://developer.riotgames.com/api/methods#!/968/3326
	# region: na
	# locale: blank (default locale)
	# version: empty (latest version)
	# dataById: blank (false)
	# champData: none selected

	# Sample response body:
	# {
 	#   "data": {
 	#      "Aatrox": {
 	#         "id": 266,
 	#         "title": "the Darkin Blade",
 	#         "name": "Aatrox",
 	#         "key": "Aatrox"
 	#      }
 	#   	}
 	#  }

end