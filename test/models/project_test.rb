require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "project requires a name" do
    project = Project.new(description: "Missing project name")

    assert_not project.valid?
    assert_includes project.errors[:name], "can't be blank"
  end
end
