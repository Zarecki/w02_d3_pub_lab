class Customer
  attr_reader :name, :wallet, :age, :drunkness
  def initialize(name, wallet, age, drunkness=0)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = drunkness
  end

  def take_money_from_wallet(drink)
    return @wallet -= drink.price
  end

  def buy_drink(drink,pub)
    if customer_is_of_age? && customer_is_under_alcohol_limit?
      pub.take_drink_from_stock(drink)
      pub.add_money_to_till(drink)
      take_money_from_wallet(drink)
      change_customer_drunkness(drink)
    else
      return "You are underage"
    end
  end

  def customer_is_of_age?
    @age >= 18 ? true : false
  end

  def change_customer_drunkness(drink)
    @drunkness += drink.alcohol_level
  end

  def customer_is_under_alcohol_limit?
    @drunkness < 20 ? true : false
  end



end
