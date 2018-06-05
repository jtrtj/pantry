require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

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

  def test_you_can_add_recipes_to_the_shopping_list
    recipe = Recipe.new('Cheese Pizza')
    recipe.add_ingredient('Cheese', 20)
    recipe.add_ingredient('Flour', 20)

    pantry = Pantry.new
    pantry.add_to_shopping_list(recipe)

    assert_equal ({ 'Cheese' => 20, 'Flour' => 20 }), pantry.shopping_list
  end
end
