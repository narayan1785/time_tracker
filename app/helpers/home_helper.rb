module HomeHelper

  # Returns value "1Hrs 30min"
  # i/p : total_minute (Integer)
  def duration_hr(total_minute)
    return "0 Hr 0 min" if total_minute.blank?
  	mins = (total_minute) % 60
    hrs = total_minute / 60
    hrs >= 1 ?  "#{ hrs.to_i }Hrs #{ mins.to_i }min" : "0Hrs #{ mins }min"
  end

end
