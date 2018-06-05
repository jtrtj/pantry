class Recipe
  attr_reader :name,
              :ingredients
  def initialize(name)
    @name        = name
    @ingredients = {}
  end

  def ingredient_types
    @ingredients.keys
  end

  def add_ingredient(ingredient_name, amount)
    @ingredients[ingredient_name] = amount
  end

  def amount_required(ingredient_name)
    @ingredients[ingredient_name]
  end

  def most_required
    most_required = @ingredients.keys.max
  end
  
  def most_required_amount
    most_required = @ingredients.keys.max
    amount_required(most_required)
  end
end
