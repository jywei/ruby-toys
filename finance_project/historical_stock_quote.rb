require 'yahoo-finance'
require 'awesome_print'

class HistoricalStockQuote
  def self.historical_price(symbol)
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.historical_quotes(symbol, { start_date: Time::now - (24 * 60 * 60 * 365), end_date: Time::now })
    data.map do |quote|
      [quote.trade_date, quote.open]
    end
  end

  def self.write_price_by_symbol(symbol)
    quotes = historical_price(symbol)
    filename = "#{symbol}.csv"
    CSV.open(filename, "w") do |file|
      quotes.each do |quote|
        file << quote
      end
    end
  end
end

