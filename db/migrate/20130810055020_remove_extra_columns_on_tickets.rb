class RemoveExtraColumnsOnTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :name, :display_name
    remove_column :tickets, :todo
    remove_column :tickets, :system_ticket_id
  end
end
