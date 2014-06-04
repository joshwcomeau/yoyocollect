class ManufacturersController < ApplicationController
	def index
		render json: Manufacturer.all
	end
end
