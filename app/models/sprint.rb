class Sprint < ActiveRecord::Base

  STATUS = {active: 0, closed: 1}

  has_many :stories
  has_many :tickets, through: :stories
  has_many :worked_hours, through: :tickets

  scope :active, -> { where(status: STATUS[:active]) }

  attr_accessible :display_name, :status, :start_date, :end_date

end