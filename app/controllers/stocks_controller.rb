class StocksController < ApplicationController
	
	def search
		#@stock = Stock.first
		if params[:stock]
			Rails.logger.info "@"*50
			Rails.logger.info params[:stock]
			@stock = Stock.find_by_ticker(params[:stock])
			Rails.logger.info @stock
			Rails.logger.info "@"*50
			@stock ||= Stock.new_from_lookup(params[:stock])
		end
		if @stock
			render partial: 'lookup'
		else
			render status: :not_found, nothing: true
		end
	end
end
