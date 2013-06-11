class AddSystemTicketIdToEpic < ActiveRecord::Migration
  def change
    add_column :epics, :system_ticket_id, :string
  end
end
