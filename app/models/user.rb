class User < ActiveRecord::Base
	validates :name, presence: true
	validates :games_counter, presence: true

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)

	    if user.games_counter == nil
	    	user.games_counter = 0
	    end
	    user.save!
	  end
	end
end