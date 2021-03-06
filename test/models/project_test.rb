require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  def setup
    @project = Project.new(name: "Project Name", description: "This is a test description", user_id: 1)
  end
  
  test "project is valid" do
    assert @project.valid?
  end
  
  test "name should be present" do
    @project.name = ""
    assert_not @project.valid?
  end
  
  test "name should not be too short" do
    @project.name = "a"
    assert_not @project.valid?
  end
  
  test "name should not be too long" do
    @project.name = "a" * (get_validation_max(Project, :name) + 1)
    assert_not @project.valid?
  end
  
  test "description should be present" do
    @project.description = ""
    assert_not @project.valid?
  end
  
  test "description should not be too short" do
    @project.description = "a" * 9
    assert_not @project.valid?
  end
  
  test "description should not be too long" do
    @project.description = "a" * (get_validation_max(Project, :description) + 1)
    assert_not @project.valid?
  end
  
  test "repo link should not be too short" do
    @project.repo_link = "a"
    assert_not @project.valid?
  end
  
  test "repo link should not be too long" do
    @project.repo_link = "a" * (get_validation_max(Project, :repo_link) + 1)
    assert_not @project.valid?
  end
end
