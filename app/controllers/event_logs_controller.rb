class EventLogsController < ApplicationController

  # Get all event logs for a given day
  def index
	@event_logs = EventLog.get_event_logs.order("updated_at DESC").page params[:page]
  end

end
