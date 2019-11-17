class AddRecordingTimeSecondsToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :recording_time_seconds, :integer
  end
end
