class WorkedHour < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  belongs_to :tag

  attr_accessible :amount, :on, :tag_id, :ticket_id, :description

  class << self

    def for_this_week
      from_date = Date.today.beginning_of_week
      WorkedHour.where('worked_hours.on >= ?', from_date).group_by { |w| w.on.strftime('%A').downcase }
    end

  end

end
