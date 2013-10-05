class Story < ActiveRecord::Base

  # Avoid destroying stories with tickets associated.
  #   When a story must be deleted all its tickets should be deleted before.
  #
  before_destroy :prevent_destroy_with_tickets

  belongs_to :sprint

  has_many :tickets, dependent: :destroy
  has_many :worked_hours, through: :tickets

  attr_accessible :display_name, :sprint_id

  # Returns the sum of ticket's estimation.
  #
  # @return [Integer]
  def total_estimation
    tickets.sum(&:estimation)
  end

  # @overrides
  #
  def as_json(options)
    super(options.merge({includes: :total_estimation}))
  end

  private

  # Returns true if current story has no ticket associated
  #   otherwise returns false.
  #
  # @return [Boolean]
  def prevent_destroy_with_tickets
    return self.tickets.empty?
  end

end