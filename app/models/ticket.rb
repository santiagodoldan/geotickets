class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :epic
  attr_accessible :description, :estimation, :name, :todo, :user_id, :epic_id

  validates :epic, :name, :estimation, :presence => true
end
