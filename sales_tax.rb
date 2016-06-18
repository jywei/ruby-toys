require_relative("print_receipt.rb")

class Product

  attr_accessor :item_name, :price, :exempt, :imported, :tax

  def initialize(item_name, price, exempt, imported)
    @item_name = item_name
    @price = price.to_f
    @exempt = exempt
    @imported = imported
    @tax = 0
  end

  def calculate_tax

    if @exempt == false && @imported == true
      @tax = @price * 0.15
    elsif @exempt == false && @imported == false
      @tax = @price * 0.10
    elsif @exempt == true && @imported == false
      @tax = 0
    end

  end
end

book = Product.new('book1', 10.00, true, false)
cd = Product.new('cd1', 5.00, false, false)

new_receipt = Receipt.new
new_receipt.add_to_receipt(book)
new_receipt.add_to_receipt(cd)

puts new_receipt.print_list
