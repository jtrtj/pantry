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

  def test_items_can_be_restocked
    pantry = Pantry.new

    pantry.restock('Cheese', 10)
    assert_equal 10,pantry.stock_check('Cheese')

    pantry.restock('Cheese', 20)
    assert_equal 30,pantry.stock_check('Cheese')
  end
end
