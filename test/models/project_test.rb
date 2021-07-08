require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without a title" do
    project = Project.new(description: "Proj2", summary: "The 3rd proj")
    assert_not project.save
  end
  test "should not save without a description" do
    project = Project.new(title: "Proj2", summary: "The 3rd proj")
    assert_not project.save
  end
  # test "should not save without a title" do
  #   project = Project.new(description: "Proj2", summary: "The 3rd proj")
  #   assert_not project.save
  # end
end
