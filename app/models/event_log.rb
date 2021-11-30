class EventLog < ApplicationRecord
  paginates_per 5

  belongs_to :time_tracker

  scope :get_event_logs, ->(time_tracker_id) { where(time_tracker_id: time_tracker_id) }

  # Add event trail on clockin
  def self.create_event_trail(time_tracker_obj)
    create(in_time: DateTime.now, time_tracker: time_tracker_obj)
  end
 
  # Update out time for last event trail
  def self.update_event_trail(time_tracker_obj)
    tracker_log_obj = time_tracker_obj.event_logs.where(out_time: nil)	
    tracker_log_obj.update(out_time: DateTime.now)
  end
  
end
