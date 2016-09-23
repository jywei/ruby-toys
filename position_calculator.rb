require 'faker'
require 'awesome_print'
require 'pry-byebug'

class PositionCalculator
  def position
    hash1 = {
      current_position: {
        h: (hp = Faker::Number.between(-300, 200)),
        a: (ap = Faker::Number.between(-300, 200)),
        d: (dp = Faker::Number.between(-300, 200))
      },
      thresholds: {
        h: (ht = Faker::Number.between(-200, 100)),
        a: (at = Faker::Number.between(-200, 100)),
        d: (dt = Faker::Number.between(-200, 100))
      },
      distance: {
        h: (hp - ht),
        a: (ap - at),
        d: (dp - dt)
      }
    }
    # ap hash1

    distant_percentage = {}
    limit = hash1[:thresholds]
    hash1[:distance].each do |k, v|
      limit[k] < 0 ? distant_percentage[k] = (v.to_f / limit[k].to_f rescue 0).round(3) : distant_percentage[k] = -(v.to_f / limit[k].to_f rescue 0).round(3)
    end
    # ap distant_percentage

    warning_meter = distant_percentage.map { |k, v| v + 1 }
    # ap warning_meter

    warning_sign = warning_meter.map do |v|
      case v
        when -99999..0 then "Good"
        when 0..0.5    then "Nothing"
        when 0.5..0.75 then "Warning"
        when 0.75..0.9 then "Bad"
        when 0.9..1    then "Very Bad"
        else                "Super Bad"
      end
    end
    # ap warning_sign

    hash2 = {
      current_position: {
        h: hash1[:current_position][:h],
        a: hash1[:current_position][:a],
        d: hash1[:current_position][:d]
      },
      thresholds: {
        h: hash1[:thresholds][:h],
        a: hash1[:thresholds][:a],
        d: hash1[:thresholds][:d]
      },
      distance: {
        h: hash1[:distance][:h],
        a: hash1[:distance][:a],
        d: hash1[:distance][:d]
      },
      warning_meter: {
        h: (warning_meter[0] * 100).round(3),
        a: (warning_meter[1] * 100).round(3),
        d: (warning_meter[2] * 100).round(3)
      },
      warning_sign: {
        h: warning_sign[0],
        a: warning_sign[1],
        d: warning_sign[2]
      }
    }
    ap hash2
  end
end

p = PositionCalculator.new
p.position
