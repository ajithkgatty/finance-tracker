class Stock < ApplicationRecord
	has_many :user_stocks
	has_many :users, through: :user_stocks

	def self.find_by_ticker(ticker_symbol)
		where(ticker: ticker_symbol).first
	end

	def self.new_from_lookup(ticker_symbol)
		looked_up_stock = StockRecord.find_by_ticker(ticker_symbol)
		# return nil if looked_up_stock.is_a?(StockQuote::NoDataForStockError)
		return nil unless looked_up_stock
		new_stock = new(ticker: looked_up_stock.ticker, name: looked_up_stock.name)
		new_stock.last_price = new_stock.price
		new_stock
	end

	def price
		closing_price = StockRecord.find_by_ticker(ticker).close
		return "#{closing_price} (Closing)" if closing_price
		opening_price = StockRecord.find_by_ticker(ticker).open
		return "#{opening_price} (Opening)" if opening_price
		'Unavailable'
	end
end



