class TimeTracker < ApplicationRecord
  paginates_per 5
  attr_accessor :clock_in, :clock_out, :edit_time_log

  belongs_to :user
  has_many :event_logs

  scope :get_time_tracker, ->(id) { where(id: id) }

  #validate :current_date_edit, :on => :update
  validates_date :day_in, on: :update, before: :today,  if: :edit_time_log
  validates_date :day_out, on: :update, before: :today,  if: :edit_time_log
  validates :comment,  presence: true,  if: :edit_time_log


  after_save :create_event_log, if: :clock_in
  after_update :update_event_log, if: :clock_out

  
  private

  # Update out-time for an event trail entr
  def update_event_log
  	EventLog.update_event_trail(self)
  end

  # Create in-time event trail.pa
  def create_event_log
    EventLog.create_event_trail(self)
  end


  # Returns the current active clocked in time master entry
  def self.active_clock_in(user)
    where(day_in: DateTime.now.beginning_of_day..DateTime.now.end_of_day, user: user, day_out: nil).first || []
  end

  # Return the last clocked out event for the day
  def self.clocked_out_evnt(user)
     active_clock_in(user).event_logs.where(out_time: DateTime.now.beginning_of_day..DateTime.now.end_of_day).order("updated_at DESC") rescue nil
  end

  # Return the last clocked IN event for the day
  def self.clocked_in_evnt(user)
     active_clock_in(user).event_logs.where(in_time: DateTime.now.beginning_of_day..DateTime.now.end_of_day, out_time: nil ).order("updated_at DESC") rescue nil
  end
  
  # Create a master time entry on first login of the day
  def self.add_clockin_tracker(in_time, user, clock_in_flg)
    current_clocked_in = active_clock_in(user)
    if current_clocked_in.blank?
      create(day_in: in_time, user: user, clock_in: clock_in_flg)
    else
      EventLog.create_event_trail(current_clocked_in)
    end
  end

end
