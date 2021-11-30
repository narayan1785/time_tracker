# Service class for processing Clock-In event
module TrackerServices
  class ClockIn < ApplicationService

    def initialize(user)
   	  @user = user
      @in_time = Time.now
      @is_clocking_in = true
    end

    def call
      TimeTracker.add_clockin_tracker( @in_time, @user,@is_clocking_in)
    end

  end
end