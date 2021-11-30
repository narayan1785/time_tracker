class HomeController < ApplicationController

	def index; end

  # Process the clock-in request
  def clock_in
    TrackerServices::ClockIn.call(current_user)
    redirect_to root_path
  end
  
  # Process the clock-out request
  def clock_out
    TrackerServices::ClockOut.call(current_user)
    redirect_to root_path
  end

end
