class RemoveRecordingTimeFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :recording_time, :integer
  end
end
