module Api
	class YoyosController < ApplicationController
		respond_to :json

		def index
			@manufacturers = Manufacturer.all
			render :json => @manufacturers.to_json(:include => [:yoyos]), status: 200
		end

		def show
			respond_with Yoyo.find(params[:id])
		end

		
	end
end
