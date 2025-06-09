=begin
Food delivery companies employ tens of thousands of delivery drivers who each submit hundreds of deliveries per week.
Delivery details are automatically sent to the system immediately after the delivery.

Delivery drivers have different hourly payment rates, depending on their performance.
Drivers can take on, and be paid for, multiple deliveries simultaneously.

If a driver is paid $10.00 per hour, and a delivery takes 1 hour and 30 minutes, the driver is paid $15.00 for that delivery.

We are building a dashboard to show a single number - the total cost of all deliveries - on screens in the accounting department offices.

At first, we want the following functions:

* `add_driver(driver_id [integer], usd_hourly_rate [float])`
   - The given driver will not already be in the system

* `record_delivery(driver_id [integer], start_time, end_time)`
   - Discuss the time format you choose
   - Times require minimum one-second precision
   - The given driver will already be in the system
   - All deliveries will be recorded immediately after the delivery is completed
   - No delivery will exceed 3 hours

* `get_total_cost()`
   - Return the total, aggregated cost of all drivers' deliveries recorded in the system
   - For example, return 135.30 if one driver is in the system and has a total cost of 100.30 USD and another driver is in the system and has a total cost of 35.00 USD.
   - This will be used for a live dashboard
   - Do not worry about exact formatting

All inputs will be valid.

Share any decisions or assumptions you make.
If you do anything differently in this interview than you would in production, share that.

Before you get started coding, and before we start using the AI assistant, let's discuss how you will store the time data and why.
When coding, you can use your preferred AI code assistant.
Please feel free to use your AI assistant autocomplete or chat function as you would in a normal work setting,
even if you could solve the problem without the AI assistant.

We will discuss the code after you write it.

There may be parts of the interview where I will ask you to stop using the AI assistant.

You may look up syntax using a search engine, as long as you are sharing your screen.
You may also use your AI assistant to help with syntax.
=end

=begin
The analytics team uses the live dashboard reporting function you built to see how much money is owed in total to all drivers.

Add the following functions:

* `pay_up_to (pay_time [integer, Unix time from epoch])`
   - Pay all drivers for recorded deliveries which ended up to and including the given time
   - If cutoff time happens between the delivery, the driver won't be paid for that delivery
   - every delivery has to end before the cutoff time

* `get_total_cost_unpaid()`
   - Return the total, aggregated cost of all drivers' deliveries which have not been paid

The solution does not need to be thread-safe or handle concurrency.
=end

require 'time'
require 'bigdecimal'

class FoodDeliveryPlatform
    MAX_SEC = 3 * 3600

    def initialize
       @drivers = {} # { "Bob" => 30.0, "Alice" => 35.0 } 
       @deliveries = [] # [ { driver_id: "Bob", start_time: 1714435200, end_time: 1714442400, cost: 45.0 }, ...]
       @cutoff_time = nil
    end
    
    def add_driver(driver_id:, hourly_rate:)
        raise ArgumentError, "Driver already added: #{driver_id}" if @drivers.keys.include?(driver_id)
        
        @drivers[driver_id] = hourly_rate.to_f
    end
    
    def record_delivery(driver_id:, start_time:, end_time:)
        raise ArgumentError, "No driver found: #{driver_id}" if @drivers[driver_id].nil?
        
        st = parse_time(start_time).to_i
        et = parse_time(end_time).to_i
        
        sec_diff = et - st
        raise ArgumentError, "Delivery time exceeds 3 hours" if sec_diff > MAX_SEC

        rate = @drivers[driver_id]
        delivery_cost = rate * BigDecimal(sec_diff) / BigDecimal(3600)

        @deliveries << { driver_id: driver_id, start_time: st, end_time: et, cost: delivery_cost }
    end

    def get_total_cost
        calculate_costs[:paid]
    end

    def get_total_cost_unpaid
        calculate_costs[:unpaid]
    end

    def pay_up_to(pay_time)
        @cutoff_time = parse_time(pay_time).to_i
    end
    
    private
    
    def calculate_costs
        paid = 0
        unpaid = 0

        @deliveries.each do |delivery|
            if @cutoff_time && delivery[:end_time] <= @cutoff_time
                paid += delivery[:cost]
            else
                unpaid += delivery[:cost]
            end
        end

        { paid: paid.to_f, unpaid: unpaid.to_f }
    end
    
    def parse_time(val)
       val.is_a?(Time) ? val : Time.parse(val)
    end
end

platform = FoodDeliveryPlatform.new
# platform.add_driver(driver_id: "Bob", hourly_rate: 30)
# platform.add_driver(driver_id: "Alice", hourly_rate: 35)
# platform.record_delivery(driver_id: "Bob", start_time: "2025-04-28 17:00", end_time: "2025-04-28 18:30")
# platform.record_delivery(driver_id: "Alice", start_time: Time.new(2025, 4, 28, 17, 0, 0), end_time: Time.new(2025, 4, 28, 18, 30, 0))


platform.pay_up_to("2025-04-28 18:00:01")

platform.add_driver(driver_id: 1, hourly_rate: 35.10)
platform.add_driver(driver_id: 2, hourly_rate: 15.15)
platform.add_driver(driver_id: 3, hourly_rate: 8.55)
platform.add_driver(driver_id: 4, hourly_rate: 11.28)

platform.record_delivery(driver_id: 1, start_time: "2025-04-28 17:00", end_time: "2025-04-28 18:00");   # Jan 1 1970 00:00:00 - Jan 1 1970 01:00:00, 1hr
platform.record_delivery(driver_id: 2, start_time: "2025-04-28 17:00", end_time: "2025-04-28 18:30");   # Jan 1 1970 00:00:00 - Jan 1 1970 01:30:00, 1.5hr
platform.record_delivery(driver_id: 2, start_time: "2025-04-28 18:30", end_time: "2025-04-28 19:00");   # Jan 1 1970 00:01:30 - Jan 1 1970 00:02:00, 0.5hr

# p platform.get_total_cost_unpaid
# p platform.get_total_cost

puts platform.get_total_cost_unpaid # 35.10
puts platform.get_total_cost # 15.15 * 1.5 + 15.15 * 0.5 = 30.30
