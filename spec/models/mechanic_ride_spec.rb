require 'rails_helper'

 RSpec.describe MechanicRide, type: :model do
   describe 'relationships' do
     it { should have_many(:mechanics) }
     it { should have_many(:rides) }
   end
 end
