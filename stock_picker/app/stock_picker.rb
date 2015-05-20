module StockPicker

  def pick(days)
    indexes = []
    best_profit = 0

    days.each.with_index do |price,day|
      largest = days[day+1...days.length].max
      if largest
        if (largest - price) > best_profit
          best_profit = largest - price
          indexes = [day,days.find_index(largest)]
        end
      end
    end
    indexes
  end
end
