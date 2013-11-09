class WorkedHour < ActiveRecord::Base
  #include SharedConcerns::FengWorkHours

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

    def grouped_by_user_and_tag
      scoped.select('user_id, tag_id, SUM(worked_hours.amount) as total').group('user_id, tag_id').includes(:user)
    end

    def to_report
      result = scoped.grouped_by_user_and_tag.inject({}) do |result, wh|
        result[wh.user_id] ||= {}
        result[wh.user_id][:user_name] = wh.user.name
        result[wh.user_id][:tags] ||= {}
        result[wh.user_id][:tags][wh.tag_id] = wh.total
        result
      end

      result.values
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
