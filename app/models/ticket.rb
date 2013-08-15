class Ticket < ActiveRecord::Base

  belongs_to :user
  belongs_to :story

  has_many :workers, class_name: 'User', through: :worked_hours, source: :user, uniq: true
  has_many :worked_hours

  validates :display_name, :estimation, :story, presence: true

  attr_accessible :display_name, :estimation

  #
  #
  #
  def as_json(options)
    super(options.merge({includes: :total_hours_by_tag}))
  end

  #
  #
  #
  def total_hours_by_tag
    hours_by_tag = worked_hours.includes(:tag).group('tags.id').sum(:amount)
    hours_by_tag.merge(total: hours_by_tag.values.sum)
  end

end
