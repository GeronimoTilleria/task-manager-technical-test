class ProjectsController < ApplicationController
    def index
        @projects = 
            if params[:status].present?
                Project.where(status: params[:status])
            else
                Project.all
            end
    end

    def show
        @project = Project.find(params[:id])
        @task = Task.new
    end
end
