module Api
	class LoginController < ApplicationController
		respond_to :json

		def authenticate
			if login(params[:user][:email], params[:user][:password])
				render json:{
					token: current_user.api_key.access_token,
					email: current_user.email
				}
			else {
				render json:{
					message: "Username or password not valid"
				}, status: 500
			}
			end
		end
	end
end