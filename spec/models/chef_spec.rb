require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

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
  end

  describe 'instance methods' do

    describe '#ingredients' do
      it 'returns a distinct array of ingredients the chef uses' do
        expect(charlie.ingredients).to include(flour, eggs, butter, sugar, pineapple, pork)
        expect(charlie.ingredients).to_not include(chilis)
      end
    end
  end
end