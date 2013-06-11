class CreateEpics < ActiveRecord::Migration
  def change
    create_table :epics do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
