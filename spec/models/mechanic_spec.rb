require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'class methods' do
    describe '#average_years_of_experience' do
      it 'returns the average years of experience of all mechanics' do
        @kara = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
        @fred = Mechanic.create!(name: 'Fred Boat', years_experience: 6)

        expect(Mechanic.average_years_of_experience).to eq(8.5)
      end
    end
  end
  describe 'instance methods' do
    describe '#ordered_rides' do
      it 'returns a list of open rides that the mechanic is assigned in descending order of thrill rating' do
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

        expect(@kara.ordered_rides).to eq([@hurler, @jaws, @scrambler])
      end
    end
  end
end
