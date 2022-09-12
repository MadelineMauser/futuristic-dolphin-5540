class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_yoe = Mechanic.average_years_of_experience
  end
end
