require("minitest/autorun")
require("minitest/rg")

require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new('Dead Pony Club', 6)
    @drink2 = Drink.new('Corona', 3)
    @drink3 = Drink.new('Tenants', 4)
    @drink4 = Drink.new('Nice Ale', 5)
    @drinks = [@drink1,@drink2,@drink3,@drink4]
    @pub = Pub.new('The Stables', 50, @drinks)
    @customer1 = Customer.new('Sally', 15)
  end

  def test_get_pub_name
    assert_equal('The Stables', @pub.name)
  end

  def test_get_till_amount
    assert_equal(50, @pub.till)
  end

  def test_get_drinks_number
    assert_equal(4, @pub.drinks.count)
  end

  def test_take_drink_from_stock
    result = @pub.take_drink_from_stock(@drink3)
    assert_equal(@drink3, result)
  end

end
