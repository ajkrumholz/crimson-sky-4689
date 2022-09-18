require 'rails_helper'

RSpec.describe 'chef show page' do
  # As a visitor
  # When I visit a chef's show page
  # I see the name of that chef
  # And I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredient index page
  # and I can see a unique list of names of all the ingredients that this chef uses.
  let!(:charlie) { Chef.create!(name: 'Charlie Akins') }
  let!(:baron) { Chef.create!(name: 'Baron von Cookenmann') }

  let!(:pineapple_souffle) { charlie.dishes.create!(name: "Pineapple Souffle", description: "A whirlwind of pineapple scented exultation") }
  let!(:pork_pie) { charlie.dishes.create!(name: "Pork Pie", description: "A tumult of tummy titillating textures") }
  let!(:sausage) { baron.dishes.create!(name: "Handmade Chorizo", description: "A searing symphony of sumptuous scrumption") }

  let!(:flour) { Ingredient.create!(name: "Flour", calories: 500) }
  let!(:eggs) { Ingredient.create!(name: "Eggs", calories: 250) }
  let!(:butter) { Ingredient.create!(name: "Butter", calories: 300) }
  let!(:sugar) { Ingredient.create!(name: "Sugar", calories: 800) }
  let!(:pork) { Ingredient.create!(name: "Pork", calories: 750) }
  let!(:pineapple) { Ingredient.create!(name: "Pineapple", calories: 500) }
  let!(:chilis) { Ingredient.create!(name: "Red Chilis", calories: 100) }

  before :each do
    pineapple_souffle.ingredients << flour
    pineapple_souffle.ingredients << eggs
    pineapple_souffle.ingredients << butter
    pineapple_souffle.ingredients << sugar
    pineapple_souffle.ingredients << pineapple
    
    pork_pie.ingredients << flour
    pork_pie.ingredients << eggs
    pork_pie.ingredients << butter
    pork_pie.ingredients << pork

    sausage.ingredients << pork
    sausage.ingredients << chilis
    sausage.ingredients << sugar

    visit chef_path(charlie)
  end

  describe 'when I visit a chef show page' do
    it 'displays the name of the chef' do

      expect(page).to have_content(charlie.name)

      expect(page).to_not have_content(baron.name)
    end

    it 'displays a link to view all ingredients used by chef' do
      expect(page).to have_link "#{charlie.name}'s Ingredients"
    end

    describe 'when I visit the ingredient index' do
      it 'displays a unique list of names of all ingredients used by chef' do
        click_on "#{charlie.name}'s Ingredients"

        expect(current_path).to eq(chef_ingredients_path(charlie))

        expect(page).to have_content(flour.name)
        expect(page).to have_content(eggs.name)
        expect(page).to have_content(pork.name)
        expect(page).to have_content(sugar.name)
        expect(page).to have_content(butter.name)

        expect(page).to_not have_content(chilis.name)
      end
    end
  end

end