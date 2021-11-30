# Service class for processing the Clock-Out event..
module TrackerServices
  class ClockOut < ApplicationService
    
    def initialize(user)
     	@user = user
      @out_time = Time.now
      @is_clocking_out = true
    end

    def call
      active_clockin = TimeTracker.active_clock_in(@user)
      active_clockin.update(clock_out: @is_clocking_out, total_session_min: session_duration(active_clockin))
    end

    private
    # Process the logged-in time in minutes
    def session_duration(clock_in_obj)
      clock_in_obj.total_session_min+= (@out_time - clock_in_obj.day_in.to_time).seconds.in_minutes.round(1)
    end
    
  end
end