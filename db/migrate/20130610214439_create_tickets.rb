class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.references :user
      t.references :epic
      t.text :description
      t.float :estimation
      t.float :todo

      t.timestamps
    end
    add_index :tickets, :user_id
    add_index :tickets, :epic_id
  end
end
