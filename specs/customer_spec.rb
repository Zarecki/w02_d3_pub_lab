require("minitest/autorun")
require("minitest/rg")

require_relative("../customer")
require_relative("../pub")
require_relative("../drink")

class CustomerTest < MiniTest::Test
  def setup
    @drink1 = Drink.new('Dead Pony Club', 6, 7)
    @drink2 = Drink.new('Corona', 3, 3)
    @drink3 = Drink.new('Tenants', 4, 5)
    @drink4 = Drink.new('Nice Ale', 5, 8)
    @drinks = [@drink1,@drink2,@drink3,@drink4]
    @pub = Pub.new('The Stables', 50, @drinks)
    @customer1 = Customer.new('Sally', 15, 17)
    @customer2 = Customer.new('Dennis', 30, 45)
    @customer3 = Customer.new('Jim', 10, 36, 21)
  end

  def test_get_customer_name
    assert_equal('Sally', @customer1.name)
  end

  def test_get_wallet
    assert_equal(15, @customer1.wallet)
  end

  def test_take_money_from_wallet
    result = @customer1.take_money_from_wallet(@drink4)
    assert_equal(10, result)
  end

  def test_buy_drink__underage
    result = @customer1.buy_drink(@drink2, @pub)
    assert_equal(4, @pub.drinks.count)
    assert_equal(50, @pub.till)
    assert_equal(15, @customer1.wallet)
    assert_equal("You are underage", result)
  end

  def test_buy_drink__of_age_under_alcohol_limit
    @customer2.buy_drink(@drink2, @pub)
    assert_equal(3, @pub.drinks.count)
    assert_equal(53, @pub.till)
    assert_equal(27, @customer2.wallet)
    assert_equal(3, @customer2.drunkness)
    assert_equal(true, @customer2.customer_is_under_alcohol_limit?)
  end

  def test_buy_drink__of_age_over_alcohol_limit
    @customer3.buy_drink(@drink2, @pub)
    assert_equal(4, @pub.drinks.count)
    assert_equal(50, @pub.till)
    assert_equal(10, @customer3.wallet)
    assert_equal(21, @customer3.drunkness)
    assert_equal(false, @customer3.customer_is_under_alcohol_limit?)
  end

  def test_get_customer_age
    assert_equal(45, @customer2.age)
  end

  def test_customer_is_of_age__false
    result = @customer1.customer_is_of_age?
    assert_equal(false, result)
  end

  def test_customer_is_of_age__true
    result = @customer2.customer_is_of_age?
    assert_equal(true, result)
  end

  def test_get_customer_drunkness
    assert_equal(0, @customer2.drunkness)
  end

  def test_change_customer_drunkness__increase
    result = @customer2.change_customer_drunkness(@drink2)
    assert_equal(3, result)
  end

  def test_customer_is_under_alcohol_limit__false
    result = @customer3.customer_is_under_alcohol_limit?
    assert_equal(false, result)
  end

  def test_customer_is_under_alcohol_limit__true
    result = @customer1.customer_is_under_alcohol_limit?
    assert_equal(true, result)
  end


end
