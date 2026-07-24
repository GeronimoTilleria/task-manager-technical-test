require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # Caso 4: Task pertenece a Project
  test "invalid without project" do
    task = Task.new(title: "Configurar Servidor", project: nil)

    assert_not task.valid?
    assert_includes task.errors[:project], "must exist"
  end

  test "valid with associated project" do
    project = projects(:one)
    task = Task.new(title: "Configurar Servidor", project: project)

    assert task.valid?
  end
end
