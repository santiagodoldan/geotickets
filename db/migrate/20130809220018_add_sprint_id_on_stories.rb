class AddSprintIdOnStories < ActiveRecord::Migration
  def change
    add_column :stories, :sprint_id, :integer
    add_index :stories, :sprint_id
  end
end
