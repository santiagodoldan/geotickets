class Ticket < ActiveRecord::Base

  # Avoid destroying tickets with worked hours associated.
  #   When a ticket must be deleted all its worked hours should be deleted before.
  #
  before_destroy :prevent_destroy_with_wh

  belongs_to :user
  belongs_to :story

  has_many :workers, class_name: 'User', through: :worked_hours, source: :user, uniq: true
  has_many :worked_hours

  validates :display_name, :estimation, :story, presence: true

  attr_accessible :display_name, :estimation

  class << self

    def to_report
      scoped.includes(:worked_hours).map do |ticket|
        {
          display_name: ticket.display_name,
          estimation:   ticket.estimation,
          total_hours:  ticket.total_hours_by_tag,
          worked_hours: ticket.worked_hours.to_report
        }
      end
    end

  end

  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

  def worked_hours_by_user_and_tag
    worked_hours.grouped_by_user_and_tag.map do |worked_hour|
      {
        user_id: worked_hour.user_id,
        tag_id: worked_hour.tag_id,
        amount: worked_hour.total
      }
    end
  end

  # Returns true if current ticket has no worked hours associated
  #   otherwise returns false.
  #
  # @return [Boolean]
  def prevent_destroy_with_wh
    return self.worked_hours.empty?
  end

end
