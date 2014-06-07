module Api
	class LoginController < ApplicationController
		respond_to :json

		def authenticate
			logout
			if login(params[:user][:email], params[:user][:password])
				render json: {
					token: current_user.api_key.access_token,
					email: current_user.email
				}
			end
		end
	end
end