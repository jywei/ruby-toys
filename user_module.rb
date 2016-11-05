# user class with destructable module:

module Destructable
  def destroy(anyobject)
    puts "I will destroy the object"
  end
end

class User
  include Destructable
  attr_accessor :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end

  def run
    puts "Hey I'm running"
  end

  def self.identify_yourself
    puts "Hey I am a class method"
  end

end

class Buyer < User
  def run
    puts "Hey I'm not running and I'm in buyer class"
  end
end

class Seller < User

end

class Admin < User

end
