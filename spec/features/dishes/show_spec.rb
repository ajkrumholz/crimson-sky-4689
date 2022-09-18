require 'rails_helper'

RSpec.describe 'dish show page' do

  let!(:charlie) { Chef.create!(name: 'Charlie Akins') }

  let!(:pineapple_souffle) { charlie.dishes.create!(name: "Pineapple Souffle", description: "A whirlwind of pineapple scented exultation") }
  let!(:pork_pie) { charlie.dishes.create!(name: "Pork Pie", description: "A tumult of tummy titillating textures") }

  let!(:flour) { Ingredient.create!(name: "Flour", calories: 500) }
  let!(:eggs) { Ingredient.create!(name: "Eggs", calories: 250) }
  let!(:butter) { Ingredient.create!(name: "Butter", calories: 300) }
  let!(:sugar) { Ingredient.create!(name: "Sugar", calories: 800) }
  let!(:pork) { Ingredient.create!(name: "Pork", calories: 750) }
  let!(:pineapple) { Ingredient.create!(name: "Pineapple", calories: 500) }

  # As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # And I see the chef's name.
  describe 'when I visit a dish show page' do
    before(:each) do
      pineapple_souffle.ingredients << flour
      pineapple_souffle.ingredients << eggs
      pineapple_souffle.ingredients << butter
      pineapple_souffle.ingredients << sugar
      pineapple_souffle.ingredients << pineapple
      
      pork_pie.ingredients << flour
      pork_pie.ingredients << eggs
      pork_pie.ingredients << butter
      pork_pie.ingredients << pork
    end

    it 'displays the dish name and description' do

    end

    it 'displays a list of ingredients for the dish' do

    end

    it 'displays the name of the dish chef' do

    end
  end
end