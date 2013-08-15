class RemoveExtraColumnsOnStories < ActiveRecord::Migration
  def change
    rename_column :stories, :name, :display_name
    remove_column :stories, :system_ticket_id
  end
end
