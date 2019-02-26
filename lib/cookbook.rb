require 'pry'

class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary_hash = Hash.new(0)
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient|
      summary_hash[:name] = recipe.name
      # binding.pry
      # summary_hash[:details] = Hash.new(0)
        # summary_hash[:ingredients] = :ingredient[ingredient.name]
        # {ingredients: [ingredient: ingredient.name, amount: [ingredient.amount]})
      end
    end
    summary_hash
  end
    # summary_array = []
    # summary_hash = {}
    # ingredients_hash = {}
    # @recipes.each do |recipe|
    #   summary_hash[:name] = recipe.name
    #   summary_hash[:details] = ingredients_hash
    #   ingredients_hash[ingredients:]{ [{ingredient:[recipe.ingredients_required}
    #
    #
    #   binding.pry
    # end
 #OOH, the hash INSANITY

end
