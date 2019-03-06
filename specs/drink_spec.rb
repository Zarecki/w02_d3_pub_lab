require("minitest/autorun")
require("minitest/rg")

require_relative("../drink")

class DrinkTest < MiniTest::Test
  def setup
    @drink1 = Drink.new('Dead Pony Club', 6, 7)
    @drink2 = Drink.new('Corona', 3, 3)
    @drink3 = Drink.new('Tenants', 4, 5)
    @drink4 = Drink.new('Nice Ale', 5, 8)
  end

  def test_get_drink_name
    assert_equal('Dead Pony Club',@drink1.name)
  end

  def test_get_price
    assert_equal(4, @drink3.price)
  end

  def test_get_alcohol_level
    assert_equal(8, @drink4.alcohol_level)
  end
end
