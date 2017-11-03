class Item

  def initialize(options={})
    @name  = options[:name]
    @price = options[:price]
  end

  @@discount = 0.1

  def self.discount
    if Time.now.month == 11
      @@discount += 0.2
    else
      @@discount
    end
  end

  attr_reader :price, :name
  attr_writer :price

  def info
    yield (name)
    yield (price)
  end

  def price_with_discount
    (@price - @price*self.class.discount) + tax if @price
  end

  private

    def tax
      type_tax = if self.class == VirtualItem
        1
      else
        2
      end
      cost_tax = if @price > 5
        @price*0.3
      else
        @price*0.1
      end
      cost_tax + type_tax
    end

end

