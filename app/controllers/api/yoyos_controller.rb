module Api
	class YoyosController < ApplicationController
		respond_to :json

		def index
			respond_with Yoyo.all
		end
	end
end
