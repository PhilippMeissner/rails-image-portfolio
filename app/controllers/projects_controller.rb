class ProjectsController < ApplicationController
  skip_before_filter :restrict_access, only: %i[index show]
  # same as:    only: [:index, :show]

  def index
    # Latest project comes first
    @projects = Project.all.order("created_at DESC")
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find_by_id(params[:id])
    if @project.nil?
      redirect_to root_path, flash: {error: "An error occured. There is no record for the id provided."}
    else
      @images = @project.images
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Successfully added to the database."
    else
      redirect_to new_project_path, flash: {error: "An error occured. Please try again."}

    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    if @project.destroyed?
      redirect_to root_path, notice: "Project deleted."
    else
      redirect_to root_path, flash: {error: "An error occured. Please try again."}
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :featured_image, images_attributes: [:image, :id, :name, :description, :_destroy])
    end
end
