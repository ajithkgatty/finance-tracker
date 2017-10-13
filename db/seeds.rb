# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stock.create(ticker: 'GOOG', name: 'Google', last_price: 122)


StockRecord.create([{ ticker: 'GOOG', name: 'Google', open: 120, close: 122 },
	{ ticker: 'TSlA', name: 'Tesla', open: 100, close: 125 },
	{ ticker: 'FB', name: 'Facebook', open: 80, close: 85 },
	{ ticker: 'HBC', name: 'Hardson Bay', open: 45, close: 44 },
	{ ticker: 'CTC', name: 'Cognizant', open: 50, close: 45 },
	{ ticker: 'TWTR', name: 'Twitter', open: 60, close: 65 },
	{ ticker: 'WP', name: 'Wipro', open: 35, close: 50 }
	])
