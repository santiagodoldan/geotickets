class JoinSystemTicketIdWithNameOnTicketsAndStories < ActiveRecord::Migration
  def up
    Ticket.scoped.each do |ticket|
      ticket.update_column(name: "#{ticket.system_ticket_id} #{ticket.name}")
    end

    Story.scoped.each do |story|
      story.update_column(name: "#{story.system_ticket_id} #{story.name}")
    end
  end

  def down
  end
end
