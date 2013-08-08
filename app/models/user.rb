class User < ActiveRecord::Base

  attr_accessible :name, :hours_of_work

  has_many :worked_hours

  #
  #
  #
  def search_worked_hours(options = {})
    result = worked_hours
    result = result.where(worked_hours: {on: options[:on]}) if options[:on].present?
    result
  end

  def total_hours_by_tag(ticket_id)
    hours_by_tag = worked_hours.where(ticket_id: ticket_id).includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

  def to_s
    name
  end

end
