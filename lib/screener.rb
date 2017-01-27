class StockScreener::StockScreener

attr_accessor :ticker, :company, :sector, :price

	def initialize(ticker=nil, url=nil)
		@ticker = ticker
		@url = url
	end

	def self.all
		@@all ||= scrape_screener
	end

	def self.find(id)
		self.all[id-1]
	end

end