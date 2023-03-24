class ProjectsController < ApplicationController
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    current_user ? current_user.id : 'Public user'  # or whatever
  end

  def index
    @projects = Project.order(:id)
  end

  def show
    @project = find_project(%i[comments])
  end

  def update
    project = find_project

    if project&.send("#{params[:state]}!")
      flash[:success] = "`#{project.name}` state changed to #{params[:state]}"
    else
      flash[:notice] = "Unable to update project `#{project.name}`"
    end

    redirect_to projects_path
  end

  def versions
    @project = find_project(%i[versions])
  end

  private

  def find_project(load = [])
    projects = Project.where(id: params[:id]).includes(load)
    projects = projects.order("#{load.first}.id DESC") if load.present?
    projects.first
  end
end
