require "test_helper"

class AllProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_projects_index_url
    assert_response :success
  end
end
