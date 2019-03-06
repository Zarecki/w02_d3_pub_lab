class Pub
  attr_reader :name,:drinks, :till
  attr_accessor :food
  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
    @food = []
  end

  def take_drink_from_stock(drink)
    return @drinks.delete(drink)
  end

  def add_money_to_till(drink)
     @till += drink.price
  end

  def add_food_to_pub(food)
    @food += food
  end

  def take_food_from_pub(food)
    return @food.delete(food)
  end

end
