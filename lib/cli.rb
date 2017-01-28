class StockScreener::CLI

	def call
		StockScreener::Screener.new.find_by_ticker
		puts ""
		puts ""
		puts "Welcome to your custom stock screener!"
		start
	end

	def start
		puts ""
		puts "Would you like to see todays stock list?"
		input = gets.strip
		case input
		when "yes"
			list_stocks
		when "exit" || "no"
			puts "Check back tomorrow for a new list! Goodbye."
		end

		puts ""
		puts "Which stock would you like to see more information on?"
		input = gets.strip
		stock = StockScreener::Screener.find(input.to_i)

		print_stock(stock)
		puts ""
		puts "Would you like to see another stock?"
		input = gets.strip.downcase

		if input == "yes"
			start
		else
			puts ""
			puts "Check back tomorrow for an updated list! Goodbye."
			exit
		end
	end		

	def list_stocks
			puts ""
			puts "---------  Stock recommendations for #{Time.now}  ---------"
			puts ""
			StockScreener::Screener.all.each.with_index(1) do |s, index|
				puts "#{index}. #{s.ticker}"
			end
	end
	

end