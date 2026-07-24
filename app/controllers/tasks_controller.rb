class TasksController < ApplicationController

    before_action :set_project

    def create
        @task = @project.tasks.build(task_params)

        if @task.save
            redirect_to @project
        else
            render "projects/show"
        end
    end

    def update
        @task = @project.tasks.find(params[:id])

        @task.update(done: true)

        redirect_to @project
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end

    def task_params
        params.require(:task).permit(:title, :due_date)
    end
end
