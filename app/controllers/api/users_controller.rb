module Api
	class UsersController < ApplicationController
		respond_to :json

		def create
			@user = User.new(user_params)


			if @user.save
				# Associate an API key with this user.
				@api_key = ApiKey.new(user_id: @user.id)
				if @api_key.save
					render json: {
						saved: "true",
						status: 200
					}
				else
					@user.delete
					render json: {
						saved: "false",
						status: 500
					}
				end
			end
		end


		private

		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end

	end
end