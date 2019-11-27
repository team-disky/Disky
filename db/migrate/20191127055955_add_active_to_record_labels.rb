class AddActiveToRecordLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :record_labels, :active, :boolean, default: true
  end
end
