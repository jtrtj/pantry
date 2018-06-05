require './lib/recipe.rb'

class Pantry
  attr_reader :stock,
              :shopping_list
  def initialize
    @stock         = Hash.new(0)
    @shopping_list = {}
    @cookbook      = []
  end

  def stock_check(item)
    stock[item]
  end

  def restock(item, quantity)
    stock[item] += quantity
  end

  def add_to_shopping_list(recipe)
    @shopping_list =
    recipe.ingredients.merge(shopping_list) do |ingredient, quantity, new_quantity|
      quantity + new_quantity
    end
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def print_the_shopping_list
    shopping_list.inject("") do |list, item|
      list.concat("*#{item[0]}: #{item[1]}\n")
      list
    end
  end

  def what_can_i_make
    @cookbook.map do |recipe|
      if ingredients_present?(recipe)
        recipe.name
      end
    end.compact
  end

  def ingredients_present?(recipe)
    recipe.ingredient_types.none? do |type|
     stock_check(type) < recipe.amount_required(type)
     end
  end

end
