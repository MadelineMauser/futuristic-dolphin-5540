class MechanicRidesController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @ordered_rides = @mechanic.ordered_rides
  end
end
