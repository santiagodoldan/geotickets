class AddDescriptionToWorkedHours < ActiveRecord::Migration
  def change
    add_column :worked_hours, :description, :text
  end
end
