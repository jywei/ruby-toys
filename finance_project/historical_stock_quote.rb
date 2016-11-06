require 'yahoo-finance'
require 'awesome_print'

def historical_price(symbol)
  yahoo_client = YahooFinance::Client.new
  data = yahoo_client.historical_quotes(symbol, { start_date: Time::now - (24 * 60 * 60 * 365), end_date: Time::now })
  data.map do |quote|
    [quote.trade_date, quote.open]
  end
end

ap historical_price('GOOG')

