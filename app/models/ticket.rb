class Ticket < ActiveRecord::Base

  belongs_to :user
  belongs_to :epic

  has_many :workers, class_name: 'User', through: :worked_hours, source: :user, uniq: true
  has_many :worked_hours

  validates :epic, :name, :estimation, presence: true

  attr_accessible :description, :estimation, :name, :todo, :user_id, :epic_id, :system_ticket_id

  def to_s
    system_ticket_and_name
  end

  def system_ticket_and_name
    return "#{system_ticket_id} - #{name}" if system_ticket_id.present?
    name
  end

  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

end
