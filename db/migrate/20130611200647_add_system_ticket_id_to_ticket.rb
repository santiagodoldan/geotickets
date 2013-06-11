class AddSystemTicketIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :system_ticket_id, :string
  end
end
