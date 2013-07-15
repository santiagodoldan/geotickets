class WorkedHour < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  belongs_to :tag

  attr_accessible :amount, :on, :tag_id, :ticket_id, :description

  after_create :update_todo_hours

  class << self

    def for_this_week
      from_date = Date.today.beginning_of_week
      WorkedHour.where('worked_hours.on >= ?', from_date).group_by { |w| w.on.strftime('%A').downcase }
    end

  end

  def update_todo_hours
    return true unless self.ticket

    ticket_to_update = self.ticket
    ticket_to_update.update_attributes(todo: ticket_to_update.todo - self.amount)
  end

end
