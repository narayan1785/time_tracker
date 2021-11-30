json.extract! time_tracker, :id, :day_in, :day_out, :comment, :user_id, :created_at, :updated_at
json.url time_tracker_url(time_tracker, format: :json)
