class Epic < ActiveRecord::Base

  has_many :tickets
  has_many :worked_hours, through: :tickets

  attr_accessible :end_date, :name, :start_date, :system_ticket_id

  def activate
    Epic.update_all(active: false)

    self.active = true
    self.save
  end

  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

  def total_estimation
    tickets.sum(&:estimation)
  end

  def to_s
    "#{system_ticket_id} #{name}"
  end

end