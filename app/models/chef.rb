class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    @dish_ids = self.dishes.pluck(:id)
    Ingredient.joins(:dish_ingredients).where(dish_ingredients: {dish_id: @dish_ids}).distinct
  end
end