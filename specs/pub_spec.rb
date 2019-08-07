require("minitest/autorun")
require("minitest/pride")
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require('pry')
class PubTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("drink1", 1.50, 1.5)
    @drink2 = Drink.new("drink2", 2.50, 2.5)
    @drink3 = Drink.new("drink3", 5.0, 5)
    # @drink4 = Drink.new("drink4", 10.00, 5)

    #stock = []
    @pub1 = Pub.new("Jolly Farmer", 1000, [@drink1, @drink2, @drink3])


    @customer1 = Customer.new("Ted", 100, 19, 5)
    @customer2 = Customer.new("Bertha", 100, 15, 5)
    @customer3 = Customer.new("Todd", 130, 15, 15)
  end

  def test_name_of_pub
    assert_equal("Jolly Farmer", @pub1.name())
  end

  def test_value_of_till
    assert_equal(1000, @pub1.till())
  end

  def test_drinks_in_pub #Drinks for sale
    expected = [@drink1, @drink2, @drink3]
    assert_equal(expected, @pub1.drinks())
  end

  def test_increase_value_of_till
    @pub1.increase_value_of_till(@drink2)
    assert_equal(1002.5, @pub1.till())
  end
  #We are confused. We originally had the test_increase_value_of_till in the customer_spec by accident. The customer_spec failed. But when we moved it to pub_spec, it passed. Why? Both files have the same setup info and require relative paths.

  #tests whether the pub is checking the age of customers, then refuses service to under-age or grants service to over-age. This wasn't strictly what was asked in the classnotes, which only asked to check for age (not to do something based on the age).

  #checks age of customer - seems unnecessary (see above)
  def test_checks_customer_age
    assert_equal(19, @customer1.age)
  end

  def test_checks_customer_over_18__true
    assert_equal(true, @pub1.checks_customer_over_18(@customer1))
  end

  def test_checks_customer_over_18__true
    assert_equal(false, @pub1.checks_customer_over_18(@customer2))
  end

  #tests whether pub refuses service based on drunkenness level (10 or above)
  def test_checks_customer_is_too_drunk__true
    assert_equal(true, @pub1.customer_is_too_drunk(@customer3))
  end

  def test_checks_customer_is_too_drunk__false
    assert_equal(false, @pub1.customer_is_too_drunk(@customer1))
  end

  #Pub can have a stock (maybe a Hash?) to keep track the amount of drinks available (Hard! Might need to change the drinks array to a drinks hash). I was going in the wrong direction here, so I stopped. The solution is very different, and would have meant refactoring earlier code, which I didn't want to do (I wanted something that me and Ted had done, rather than just copying the solution).
  # def test_creates_array_of_remaining_drink_prices
  #   assert_equal([], @pub1.stock())
  # end

#Pub can have a stock_value method to check the total value of its drinks. After looking at the solution, I decided it was a waste of time trying to fix my attempt. My idea wasn't goig to work, and there was no point in just copying the solution.
# def test_calculates_total_value_of_drinks_in_stock
#assert_equal(9.00, @pub1.calculates_value_of_drinks_stock())
# end


end
