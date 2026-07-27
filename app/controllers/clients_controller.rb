class ClientsController < ApplicationController
    # GET /clients/new
    def new
        @client = Client.new
    end

    # POST /clients
    def create
        @client = Client.new(client_params)

        if @client.save
        # Redirigimos a la creación de proyectos o al listado principal con un mensaje de éxito
        redirect_to new_project_path, notice: "Cliente registrado exitosamente."
        else
        # Si falla la validación, renderizamos de nuevo el formulario mostrando los errores
        render :new, status: :unprocessable_entity
        end
    end

    private

    def client_params
        params.require(:client).permit(:name, :email)
    end
end
