class User < ActiveRecord::Base
  attr_accessible :name

  has_many :worked_hours

  def total_hours_by_tag(ticket_id)
    hours_by_tag = worked_hours.where(ticket_id: ticket_id).includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

  def to_s
    name
  end

end
