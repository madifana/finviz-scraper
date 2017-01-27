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

	def self.scrape_screener
		doc = Nokogiri::HTML(open("http://www.finviz.com/screener.ashx?v=111&f=fa_netmargin_pos,sh_avgvol_o2000,ta_candlestick_d&ft=4"))
		tickers = doc.search('a[class="screener-link-primary"]')
		tickers.collect{|e| new(e.text.strip, "http://finviz.com#{e.attr("href").split("?").first.strip}")}
	end

	def doc
		@doc ||= Nokogiri::HTML(open(self.url))
	end

end