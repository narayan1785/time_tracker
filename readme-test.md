tracker = model
User - model


User has many tracker
User can edit a tracker.

User clocks in => entry in tracker with current time-stamp
User clocks outs => edit the entry in the tracker with current time-stamp

TimeTracker -> has many events
Logevent belongs to timetracker



- If user needs logs per day .. timeTracker.log_event 
- 



User logs-in 
 - View Dashboard
 - ClockIn
 - ClockOut
 - Edit time entry
  

* Dashboard
    - List entries
    - Actions 
    - Download the entries
    - View detailed log
    - Edit

* Clock-in
    - Click clock-in 

* Clock-out
    - Click clock-out

* Edit entry
    - Edit previous days entry only
    - Need to add comment before editing
    - Moderation for more transperancy


 Models
    - TimeTracker
    - LogEvent
    - User

TimeTracker
  - in_time = Dat
  - out_time 
  - Total_hours
  - comment


Log-event
  -time_tracker_id
  - in_time
  - out_time


 

