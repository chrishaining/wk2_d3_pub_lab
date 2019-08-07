require("minitest/autorun")
require("minitest/rg")
require_relative('../food')
require('pry')

class CustomerTest < MiniTest::Test

  def setup
    @food1 = Food.new("chicken", 1.50, 1)
    @food2 = Food.new("cake", 5.00, 3)
    @food3 = Food.new("pizza", 8.00, 5)
end

#the first test will check that the class has a name attribute or method
def test_food_has_name
  assert_equal("chicken", @food1.name())
end

#the second test will check that the class has a price attribute or method
def test_food_has_price
  assert_equal(1.50, @food1.price())
end

#the third test will check that the class has a food rejuvenation attribute or method.
def test_food_has_rejuvenation_level
  assert_equal(1, @food1.rejuvenation_level())
end



end
