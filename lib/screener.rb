class StockScreener::StockScreener

attr_accessor :ticker, :company, :sector, :price

	def initialize(ticker=nil, url=nil)
		@ticker = ticker
		@url = url
	end

end