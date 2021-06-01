class AddSummaryAndDescriptionmToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :summary, :text
    add_column :projects, :description, :text
  end
end
