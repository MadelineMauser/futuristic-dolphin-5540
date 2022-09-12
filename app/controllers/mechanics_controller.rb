class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanics.all
    @average_yoe = Mechanics.average_years_of_experience
  end
end
