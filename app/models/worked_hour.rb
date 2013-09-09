class WorkedHour < ActiveRecord::Base

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

  def as_json(options = {})
    super(options.merge(
        include: {
          ticket: {only: [:display_name, :estimation]},
          tag: {only: :name},
          user: {only: [:id, :name]}
        }
      )
    )
  end

end
