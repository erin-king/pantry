require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class RecipeTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_no_stock
    assert_equal ({}), @pantry.stock
  end

  def test_it_returns_zero_if_no_stock_when_checked
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock_pantry
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_check_for_enough_ingredients_for_a_given_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)

    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end

# pry(main)>
# # => false
#
# pry(main)>
#
# pry(main)> pantry.enough_ingredients_for?(mac_and_cheese)
# # => true
