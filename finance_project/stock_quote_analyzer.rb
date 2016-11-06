require 'csv'
require 'pry-byebug'

class StockQuoteAnalyzer
  def self.symbol_lookup(symbol)
    begin
      CSV.read("#{symbol}.csv")
    rescue StandardError => e
      puts e
    end
  end

  def self.average_price(symbol)
    quotes = symbol_lookup(symbol)
    prices = quotes.map do |quote|
      quote[1].to_f
    end
    puts avg_analysis = prices.reduce(:+) / prices.size
    puts highest = prices.max
    puts lowest = prices.min
  end

end

# StockQuoteAnalyzer.symbol_lookup('MSFT')
StockQuoteAnalyzer.average_price('MSFT')
