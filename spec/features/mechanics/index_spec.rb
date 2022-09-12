require 'rails_helper'

RSpec.describe 'mechanics index page', type: :feature do
  before :all do
    @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @fred = Mechanic.create!(name: 'Fred Boat', years_experience: 6)
  end
  describe 'content' do
    describe 'header' do
      it 'has a header describing the page' do
        visit '/mechanics'

        expect(page).to have_content("All Mechanics")
      end
    end
    describe 'mechanic list' do
      it 'lists name and years of experience for every mechanic' do
        visit '/mechanics'

        expect(page).to have_content("Kara Smith, 11 years of experience")
        expect(page).to have_content("Fred Boat, 6 years of experience")
      end
    end
    describe 'mechanic average experience' do
      it 'displays the average years of experience across all mechanics' do
        visit '/mechanics'

        expect(page).to have_content("Average Mechanic Experience: 8.5")
      end
    end
  end
end
