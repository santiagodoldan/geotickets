class Story < ActiveRecord::Base

  belongs_to :sprint

  has_many :tickets, dependent: :destroy
  has_many :worked_hours, through: :tickets

  attr_accessible :display_name, :sprint_id

  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

  def total_estimation
    tickets.sum(&:estimation)
  end

end