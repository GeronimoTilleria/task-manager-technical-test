require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # Caso 1: Client requiere name
  test "invalid without name" do
    client = Client.new(email: "cliente@example.com")
    
    assert_not client.valid?
    assert_includes client.errors[:name], "can't be blank"
  end

  # Caso 2: Email único
  test "invalid with duplicate email" do
    # Usamos la fixture existente de test/fixtures/clients.yml
    existing_client = clients(:one) 
    
    duplicate_client = Client.new(
      name: "Otro Cliente", 
      email: existing_client.email
    )

    assert_not duplicate_client.valid?
    assert_includes duplicate_client.errors[:email], "has already been taken"
  end

  # Caso 5: Cliente no elimina proyectos activos
  test "should not destroy client if it has active projects" do
    client = clients(:one)

    # client.projects.destroy_all
  
    client.projects.create!(title: "Sistema ERP", status: :active)
    client.reload

    assert_no_difference("Client.count") do
      client.destroy
    end
    assert_includes client.errors[:base], "Cannot delete client with active projects"
  end
end
