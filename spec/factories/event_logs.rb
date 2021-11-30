FactoryBot.define do
  factory :event_log do
    id {1}
    in_time { "2021-11-29 12:00:00" }
    out_time { "2021-11-29 3:00:00" }
    time_tracker
  end

end

