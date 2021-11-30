class CreateEventLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :event_logs do |t|
      t.datetime :in_time
      t.datetime :out_time
      t.float :session_time, null: false, default: 0
      t.references :time_tracker, foreign_key: true
      t.timestamps
    end
  end
end
