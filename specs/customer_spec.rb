require("minitest/autorun")
require("minitest/rg")

require_relative("../customer")

class CustomerTest < MiniTest::Test
  def setup
    @customer1 = Customer.new('Sally', 15)
  end

  def test_get_customer_name
    assert_equal('Sally', @customer1.name)
  end

  def test_get_wallet
    assert_equal(15, @customer1.wallet)
  end


end
