class RenameTableEpicsToStories < ActiveRecord::Migration
  def change
    rename_table :epics, :stories

    rename_column :tickets, :epic_id, :story_id
    
    remove_index :tickets, column: :epic_id
    add_index :tickets, :story_id
  end
end
