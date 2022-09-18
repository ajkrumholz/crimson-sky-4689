require 'rails_helper'

RSpec.describe Dish, type: :model do
  
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    let!(:charlie) { Chef.create!(name: 'Charlie Akins') }

    let!(:pineapple_souffle) { charlie.dishes.create!(name: "Pineapple Souffle", description: "A whirlwind of pineapple scented exultation") }

    let!(:flour) { Ingredient.create!(name: "Flour", calories: 500) }
    let!(:eggs) { Ingredient.create!(name: "Eggs", calories: 250) }
    let!(:butter) { Ingredient.create!(name: "Butter", calories: 300) }
    let!(:sugar) { Ingredient.create!(name: "Sugar", calories: 800) }
    let!(:pineapple) { Ingredient.create!(name: "Pineapple", calories: 500) }

    describe '#total_calories' do
      it 'returns the sum of calories from all ingredients in a dish' do
        pineapple_souffle.ingredients << flour
        pineapple_souffle.ingredients << eggs
        pineapple_souffle.ingredients << butter
        pineapple_souffle.ingredients << sugar
        pineapple_souffle.ingredients << pineapple
  
        expect(pineapple_souffle.total_calories).to eq(2350)
      end
    end
  end
end