def stock_picker(stock_prices)
	
	buy_value = stock_prices.min
	max_diff = 0
	buy_index = 0
	sell_index = 0
	sell_value = 0

	stock_prices.each_with_index { |val, index| 
		if val <= buy_value && index < stock_prices.size - 1
			buy_value = val
			buy_index = index
		end
		if val - buy_value >= max_diff && index > 0
			max_diff = val - buy_value
			sell_index = index
			sell_value = val
		end
		#puts "buy_value: #{buy_value} sell_value: #{sell_value}"
	}

	if stock_prices[buy_index] > stock_prices[sell_index]
		puts "You're losing money, sorry"
	else
		puts "Buy at #{stock_prices[buy_index]} and sell at #{stock_prices[sell_index]} for maximum profit!"
	end

end


puts "Enter stock prices separated by commas."
prices = gets.chomp

stock_prices = prices.split(",").map {|s| s.to_i }

stock_picker(stock_prices)