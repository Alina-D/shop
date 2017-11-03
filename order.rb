class Order

  attr_reader :items

  def initialize
    @items = Array.new
  end

  include ItemContainer


  def place
    # заказ товара
  end

end












