class Story < ActiveRecord::Base

  # Avoid destroying stories with tickets associated.
  #   When a story must be deleted all its tickets should be deleted before.
  #
  before_destroy :prevent_destroy_with_tickets

  belongs_to :sprint

  has_many :tickets, dependent: :destroy
  has_many :worked_hours, through: :tickets

  attr_accessible :display_name, :sprint_id

  class << self

    def to_report
      scoped.includes(:tickets).map do |story|
        {
          display_name: story.display_name,
          estimation:   story.total_estimation,
          total_hours:  story.total_hours_by_tag,
          tickets:      story.tickets.to_report
        }
      end
    end

  end

  #
  #
  #
  def as_json(options)
    super(options.merge({includes: :tickets, methods: :total_hours_by_tag}))
  end

  #
  #
  #
  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

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