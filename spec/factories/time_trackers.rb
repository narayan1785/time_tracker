FactoryBot.define do
  factory :time_tracker do
    id {1}
    day_in { "2021-11-29 12:00:00" }
    day_out { "2021-11-29 3:00:00" }
    comment {"Test comment"}
    user
  end

end

