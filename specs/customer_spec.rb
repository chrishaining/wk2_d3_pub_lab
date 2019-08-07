require("minitest/autorun")
require("minitest/pride")
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')
require_relative('../food')

require('pry')
class CustomerTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("drink1", 1.50, 1.5)
    @drink2 = Drink.new("drink2", 2.50, 2.5)
    @drink3 = Drink.new("drink3", 5.00, 5)

    @food1 = Food.new("chicken", 1.50, 1)
    @food2 = Food.new("cake", 5.00, 3)
    @food3 = Food.new("pizza", 8.00, 5)

    @pub1 = Pub.new("Jolly Farmer", 1000, [@drink1, @drink2, @drink3])

    @customer1 = Customer.new("Ted", 100, 15, 5)
    @customer2 = Customer.new("Bertha", 100, 15, 5)
    @customer3 = Customer.new("Todd", 130, 15, 15)
  end
  #We encountered a problem when we updated the setup info in one of the spec files. We forgot to update all the specs files. We only found the solution by looking very closely at the error message.

  def test_customer_name
    assert_equal("Ted", @customer1.name())
  end

  def test_customer_wallet
    assert_equal(100.00, @customer1.wallet())
  end

  def test_buy_drink_from_pub
    @customer1.buy_drink_from_pub(@pub1)
    assert_equal([@drink1, @drink2], @pub1.drinks())
  end

  def test_reduce_value_of_wallet
    @customer1.reduce_value_of_wallet(@drink3)
    assert_equal(95, @customer1.wallet())
  end
  #we found it really useful to use pry here. we originally had a problem because we put @drink3.price as an argument in the test. because we also had .price in the implementation, we were trying to put a .price method on a .price method!!! It gave an undefined method error.

  def test_customer_age
    assert_equal(15, @customer1.age())
  end

  #test of whether the customer has a drunkenness level. This was a bit like the bear's food. We wanted to start with a non-initialized attribute, but it didn't work. Maybe we should have created a unique method (rather than using attr_reader).
  def test_customer_drunkenness_level
    assert_equal(5, @customer1.drunkenness_level())
  end

  #testing whether customer drunkenness_level increases when they buy a drink
  def test_customer_gets_drunker_when_they_buy_drink
    assert_equal(10, @customer1.customer_gets_drunker_when_they_buy_drink(@drink3))
  end
  #the naming of this test seems overly long, but it was descriptive and helped us write the test and the implementation

#Advanced extension to decrease customer drunkenness level if they eat food
def test_customer_gets_less_drunk_with_food
  assert_equal(10, @customer3.test_customer_gets_less_drunk_with_food(@food3))
end

end
