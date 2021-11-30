class CreateTimeTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :time_trackers do |t|
      t.datetime :day_in
      t.datetime :day_out
      t.float :total_session_min,null: false, default: 0
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
