class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.includes(:comments).find(params[:id])
  end

  def update
    project = Project.find(params[:id])

    if project && project.send("#{params[:state]}!")
      flash[:success] = "`#{project.name}` state changed to #{params[:state]}"
      redirect_to projects_path
    else
      flash[:notice] = "Unable to update project `#{project.name}`"
      redirect_to projects_path
    end
  end
end
