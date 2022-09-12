require 'rails_helper'

RSpec.describe 'mechanics show page', type: :feature do
  before :all do
    @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @teacups = @six_flags.rides.create!(name: 'Teacups', thrill_rating: 4, open: true)
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
      let(:most_thrilling) {'<p>The Hurler</p>'}
      let(:moderately_thrilling) {'<p>Jaws</p>'}
      let(:least_thrilling) {'<p>The Scrambler</p>'}

      it 'shows the names of all open rides' do
        visit "/mechanics/#{@kara.id}"

        expect(page).to have_content("The Hurler")
        expect(page).to have_content("The Scrambler")
        expect(page).to have_content("Jaws")
      end
      it 'does not show the names of closed rides' do
        visit "/mechanics/#{@kara.id}"

        expect(page).to_not have_content("Ferris Wheel")
      end
      it 'does not show the names of rides that are not assigned to the mechanic' do
        visit "/mechanics/#{@kara.id}"

        expect(page).to_not have_content("Teacups")
      end
      it 'lists rides by thrill rating in descending order' do
        visit "/mechanics/#{@kara.id}"

        expect(most_thrilling).to appear_before(moderately_thrilling)
        expect(moderately_thrilling).to appear_before(least_thrilling)
      end
    end
  end
end
