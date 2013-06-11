class Epic < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date

  def activate
    Epic.update_all(active: false)

    self.active = true
    self.save
  end

end