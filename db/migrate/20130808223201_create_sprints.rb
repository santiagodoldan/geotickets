class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :display_name
      t.integer :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
