require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # Caso 3: Project pertenece a Client
  test "invalid without client" do
    project = Project.new(title: "Rediseño Web", status: "active", client: nil)

    assert_not project.valid?
    assert_includes project.errors[:client], "must exist"
  end

  test "valid with associated client" do
    client = clients(:one)
    project = Project.new(title: "Rediseño Web", status: "active", client: client)

    assert project.valid?
  end
end
