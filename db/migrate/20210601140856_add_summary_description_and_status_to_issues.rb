class AddSummaryDescriptionAndStatusToIssues < ActiveRecord::Migration[6.1]
  def change
    add_column :issues, :summary, :text
    add_column :issues, :description, :text
    add_column :issues, :status, :text
  end
end
