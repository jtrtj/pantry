require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def test_it_starts_with_an_empty_stock
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_you_can_check_the_stock_of_an_item
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check('Cheese')
  end

end
