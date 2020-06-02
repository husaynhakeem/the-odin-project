INVALID_PRICE = -1
INVALID_INDEX = -1

def stock_picker(prices)
  # Build max array
  maxArray = Array.new
  maxArray.unshift(INVALID_PRICE)

  # Populate max array
  (prices.length - 1).downto(1) do |i|
    max = maxArray.first > prices[i] ? maxArray.first : prices[i]
    maxArray.unshift(max)
  end

  # Find largest difference and its index
  maxIndex = 0
  maxDiff = maxArray.first - prices.first
  1.upto(prices.length - 1) do |i|
    diff = maxArray[i] - prices[i]
    if diff > maxDiff
      maxIndex = i
      maxDiff = diff
    end
  end

  # maxIndex is the index of the day to buy, find the index of the day to sell
  (maxIndex + 1).upto(prices.length - 1) do |i|
    if prices[i] == maxDiff + prices[maxIndex]
      return [maxIndex, i]
    end
  end

  # Should not reach this point
  return [INVALID_INDEX, INVALID_INDEX]
end