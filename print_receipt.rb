class Receipt

  def initialize
    @list = []
    @price_total = 0
    @total_tax = 0
    @grand_total = 0
  end

  def add_to_receipt(item)
    @list << item
    item.calculate_tax
    @price_total += item.price
    @total_tax += item.tax
    @grand_total = @price_total + @total_tax
  end

  def print_list
    @list.each do |product|
      puts "#{product.item_name}, #{product.price}"
    end

    puts "Subtotal: #{@price_total.round}"
    puts "Tax total: #{@total_tax.round}"
    puts "Grand total: #{@grand_total.round}"
  end

end
