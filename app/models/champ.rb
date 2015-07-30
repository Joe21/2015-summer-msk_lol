class Champ < ActiveRecord::Base

	def initial_seed
		riot_api_call['data'].each do |key, value|
			image_path = "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/" + key + "_0.jpg"
			Champ.create(name: key, riot_id: value["id"], img_url: image_path)
		end
	end

	def riot_api_call
		request = "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=" + ENV['RIOT_KEY']
		response = HTTParty.get(request)
		response_to_json = JSON.parse(response.body)

		return response_to_json
	end

	def check_for_update

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