require("minitest/autorun")
require("minitest/rg")

require_relative("../food")

class FoodTest < MiniTest::Test
  def setup
    @food1 = Food.new('Hot Dog', 5, 4)
    @food2 = Food.new('Burger', 12, 6)
    @food3 = Food.new('Nachos', 4, 3)
    @food = [@food1,@food2,@food3]
  end

  def test_get_name
    assert_equal('Nachos', @food3.name)
  end

  def test_get_price
    assert_equal(4, @food3.price)
  end

  def test_get_sober_boost
    assert_equal(6, @food2.sober_boost)
  end

end
