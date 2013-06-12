class AddHoursOfWorkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hours_of_work, :integer
  end
end
