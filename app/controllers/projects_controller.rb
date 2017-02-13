class ProjectsController < ApplicationController
  def new
    if current_user
      @user = User.find(current_user[:id])
    else
      flash[:notice] = "Please login or sign up"
      redirect_to new_user_session_path
    end
  end

  def create
    @user = User.find(current_user[:id])
    @project = Project.new(project_params)
    @project.update(user_id: @user[:id])
    if @project.save
      flash[:notice] = "Your project has been added!"
      redirect_to @project
    else
      flash[:alert] = "There was a problem adding your project"
      redirect_to new_project_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end

  private

  def project_params
    allow = [:name, :description, :estimated_time, :estimated_cost, :user_id]
    params.require(:project).permit(allow)
  end
end
