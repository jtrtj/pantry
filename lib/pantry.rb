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
    recipes_i_can_make.map do |recipe|
      recipe.name
    end
  end

  def recipes_i_can_make
    @cookbook.map do |recipe|
      if ingredients_present?(recipe)
        recipe
      end
    end.compact
  end

  def how_many_can_i_make
    recipes_i_can_make.inject({}) do |list, recipe|
      list[recipe.name] = (stock_check(recipe.most_required)) / recipe.most_required_amount
      list
    end
  end

  def ingredients_present?(recipe)
    recipe.ingredient_types.none? do |type|
     stock_check(type) < recipe.most_required_amount
     end
  end

end
