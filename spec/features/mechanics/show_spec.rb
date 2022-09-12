require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
  before :all do
    @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @assignment1 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @hurler.id)
    @assignment2 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @scrambler.id)
    @assignment3 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @ferris.id)
    @assignment4 = MechanicRide.create!(mechanic_id: @kara.id, ride_id: @jaws.id)
  end
  describe 'content' do
    describe 'mechanic basic info' do
      it 'shows the name of the mechanic' do
        visit "/mechanics/#{@kara.id}"

        expect(page).to have_content("Kara Smith")
      end
      it 'shows the years of experience of the mechanic' do
        visit "/mechanics/#{@kara.id}"

        expect(page).to have_content("Years of experience: 11")
      end
    end
    describe 'mechanic ride info' do
      
    end
  end
end
