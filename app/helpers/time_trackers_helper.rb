module TimeTrackersHelper

  # Returns formatted string based on type.
  # for Type : date , o/p "1-DEC-2021"
  # for Type : time , o/p "01:03:10 AM"
  def format_time(time, frmt_type)
  	return "-NA-" if time.blank?
  	case frmt_type
  	when 'date'
      time.strftime('%v')
  	when 'time'
	  time.strftime("%r")
  	end
  end

end
