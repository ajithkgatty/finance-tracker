class Stock < ApplicationRecord

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


# StockRecord.create({ ticker: 'GOOG', name: 'Google', open: 120, close: 122 })
# StockRecord.create({ ticker: 'TSlA', name: 'Tesla', open: 100, close: 125 })
# StockRecord.create({ ticker: 'FB', name: 'Facebook', open: 80, close: 85 })
# StockRecord.create({ ticker: 'HBC', name: 'Hardson Bay', open: 45, close: 44 })
# StockRecord.create({ ticker: 'CTC', name: 'Cognizant', open: 50, close: 45 })
# StockRecord.create({ ticker: 'TWTR', name: 'Twitter', open: 60, close: 65 })
# StockRecord.create({ ticker: 'WP', name: 'Wipro', open: 35, close: 50 })
