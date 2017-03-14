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
    @project = Project.find(params[:id])
  end

  def index
    @user = User.find(current_user[:id])
    @projects = Project.where(user_id: @user[:id])

    @project_costs = []

    @projects.each do |project|
      @project_costs << project.estimated_cost
    end

    @projects_total_cost = 0;

    @project_costs.each do |cost|
      @projects_total_cost += cost
    end

  end

  private

  def project_params
    allow = [:name, :description, :estimated_time, :estimated_cost, :user_id]
    params.require(:project).permit(allow)
  end
end
