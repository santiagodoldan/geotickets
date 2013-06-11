class AddActiveToEpic < ActiveRecord::Migration
  def change
    add_column :epics, :active, :boolean
  end
end
