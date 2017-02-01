class StockScreener::Scraper
	def scrape_page	
		Nokogiri::HTML(open("http://www.finviz.com/screener.ashx?v=111&f=fa_netmargin_pos,sh_avgvol_o2000,ta_candlestick_d&ft=4"))
	end

	def scrape_stocks
		self.scrape_page.css("tbody[3] tr")
	end

	def make_stocks
		scrape_stocks.each do |r|
			self.new_from_index_page(r)
		end
	end





end