class AddTagToWorkedHour < ActiveRecord::Migration
  def change
    add_column :worked_hours, :tag_id, :integer
  end
end
