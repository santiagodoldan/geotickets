class RemoveUnusedColumnsOnStories < ActiveRecord::Migration
  def change
    remove_column :stories, :active
    remove_column :stories, :start_date
    remove_column :stories, :end_date
  end
end
