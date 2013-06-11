class CreateWorkedHours < ActiveRecord::Migration
  def change
    create_table :worked_hours do |t|
      t.float :amount
      t.references :user
      t.references :ticket
      t.date :on

      t.timestamps
    end
    add_index :worked_hours, :user_id
    add_index :worked_hours, :ticket_id
  end
end
