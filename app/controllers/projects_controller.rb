class ProjectsController < ApplicationController
    def index
        base_scope = Project.includes(:client, :tasks)
        @projects = 
            if params[:status].present?
                Project.where(status: params[:status])
            else
                Project.all
            end
    end

    def show
        @project = Project.find(params[:id])
        # task = @project.tasks.build
        @task = Task.new
    end

    # GET /projects/new
    def new
        @project = Project.new
    end

    # POST /projects
    def create
        @project = Project.new(project_params)

        if @project.save
        redirect_to @project, notice: "Proyecto creado exitosamente."
        else
        # Si falla la validación, volvemos a renderizar el formulario con los errores
        render :new, status: :unprocessable_entity
        end
    end

    private

    # Parámetros permitidos para el modelo Project
    def project_params
        params.require(:project).permit(:title, :status, :client_id)
    end
end
