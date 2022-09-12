require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanicrides) }
    it { should have_many(:rides).through(:mechanicrides) }
  end
end
