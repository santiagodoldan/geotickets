class WorkedHour < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  belongs_to :tag

  attr_accessible :amount, :on
end
