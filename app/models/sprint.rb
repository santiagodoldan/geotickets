class Sprint < ActiveRecord::Base

  STATUS = {active: 0, closed: 1}

  before_save :inactivate_previous_sprint, if: :active?

  has_many :stories
  has_many :tickets, through: :stories
  has_many :worked_hours, through: :tickets

  scope :active, -> { where(status: STATUS[:active]) }

  attr_accessible :display_name, :status, :start_date, :end_date

  def active?
    status == STATUS[:active]
  end

  def to_report
    {
      display_name: display_name,
      estimation:   total_estimation,
      total_hours:  total_hours_by_tag,
      stories:      stories.to_report
    }
  end

  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

  def total_estimation
    tickets.sum(&:estimation)
  end

  private

  def inactivate_previous_sprint
    self.class.active.update_all(status: STATUS[:closed])
  end

end