class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    @dish_ids = self.dishes.pluck(:id)
    Ingredient.joins(:dish_ingredients).where(dish_ingredients: {dish_id: @dish_ids})
  end

  def distinct_ingredients
    ingredients.distinct
  end

  def top_3_ingredients
    hash = self.ingredients.joins(:dish_ingredients).group(:name).count
    hash.sort_by { |name, num_dishes| num_dishes }.reverse.first(3).to_h
  end
end