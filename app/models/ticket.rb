class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :epic
  attr_accessible :description, :estimation, :name, :todo, :user_id, :epic_id, :system_ticket_id

  validates :epic, :name, :estimation, :presence => true

  def to_s
    "#{system_ticket_id} - #{name}"
  end
end
