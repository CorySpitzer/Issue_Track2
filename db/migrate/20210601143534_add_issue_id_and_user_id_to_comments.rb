class AddIssueIdAndUserIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :issue_id, :integer
    add_column :comments, :user_id, :integer
  end
end
