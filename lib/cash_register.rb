require 'pry'
class CashRegister
  def initialize(employee_discount = nil)
    @total = 0
    @discount = employee_discount
    @@items = []
  end


  def items
    @@items
  end 
  
  attr_accessor :total, :discount, :last_transaction

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do
      items << title
    end
    @last_transaction = price * quantity
  end

  def apply_discount
    unless @discount == nil
      @total = (@total.to_f - (@total.to_f * ((1.0/100.0) * @discount.to_f)))
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= last_transaction
    @@items.pop()
  end

end
