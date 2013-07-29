class WorkedHour < ActiveRecord::Base

  after_create :update_todo_hours

  belongs_to :user
  belongs_to :ticket
  belongs_to :tag

  scope :in_week, -> date { where(on: date.beginning_of_week..date.end_of_week) }

  validates :tag, :user, presence: true

  attr_accessible :amount, :on, :tag_id, :ticket_id, :description

  class << self

    def grouped_by_day
      scoped.group_by { |w| w.on.strftime('%A').downcase }
    end

    def for_this_week
      from_date = Date.today.beginning_of_week
      WorkedHour.where('worked_hours.on >= ?', from_date).grouped_by_day
    end

  end

  def update_todo_hours
    return true unless self.ticket

    ticket_to_update = self.ticket
    ticket_to_update.update_attributes(todo: ticket_to_update.todo - self.amount)
  end

end
