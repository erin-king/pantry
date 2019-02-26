require 'pry'

class Recipe

  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    total_required = 0
    @ingredients_required.each do |ingredient_required, amount|
      if ingredient == ingredient_required
        total_required += @ingredients_required[ingredient]
      end
    end
    total_required
  end

  def total_calories
    @ingredients_required.sum do |ingredient_required, amount|
      ingredient_required.calories * amount_required(ingredient_required)
    end
  end


end
