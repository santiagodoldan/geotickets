class AddDefaultsToTickets < ActiveRecord::Migration
  def up
    change_column_default :tickets, :estimation, 0.0
    change_column_default :tickets, :todo, 0.0
  end

  def down
    change_column_default :tickets, :estimation, nil
    change_column_default :tickets, :todo, nil
  end
end
