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
end
