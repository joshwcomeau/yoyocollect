module Api
	class YoyosController < ApplicationController
		respond_to :json

		def index
			respond_with Yoyo.all
		end

		def show
			respond_with Yoyo.find(params[:id])
		end
	end
end
