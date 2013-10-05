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

  private

  # Returns true if current ticket has no worked hours associated
  #   otherwise returns false.
  #
  # @return [Boolean]
  def prevent_destroy_with_wh
    return self.worked_hours.empty?
  end

end
