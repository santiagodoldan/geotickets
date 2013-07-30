class WorkedHour < ActiveRecord::Base

  after_create :update_todo_hours

  belongs_to :user
  belongs_to :ticket
  belongs_to :tag

  validates :tag, :user, presence: true

  attr_accessible :amount, :on, :tag_id, :ticket_id, :description

  class << self

    def for_this_week
      from_date = Date.today.beginning_of_week
      WorkedHour.where('worked_hours.on >= ?', from_date).group_by { |w| w.on.strftime('%A').downcase }
    end

  end

  def as_json(options = {})
    super(options.merge(include: {ticket: {only: [:name]}, tag: {only: :name}, user: {only: [:id, :name]}}))
  end

  def update_todo_hours
    return true unless self.ticket

    ticket_to_update = self.ticket
    ticket_to_update.update_attributes(todo: ticket_to_update.todo - self.amount)
  end

end
