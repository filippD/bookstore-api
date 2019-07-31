module Api::V1
	class UserTokenController < Knock::AuthTokenController
		include Knock::Authenticable
 		skip_before_action :verify_authenticity_token
	end
end
