# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action except: %i[index show] do
    validate_user(t(:sign_in, scope: %i[flash project error]))
  end
  before_action :validate_user_type, except: %i[index show]
  before_action :set_ranking_variables, only: %i[index show]
  before_action :set_profile_variables, except: %i[index show]
  before_action :set_project, only: %i[show edit update destroy]

  # GET /projects
  def index
    @projects = Project.all
    @amounts = []
    @projects.each do |p|
      @amounts[p.id] = p.donations.sum(&:amount)
    end
  end

  # GET /projects/1
  def show
    @amount = @project.donations.sum(&:amount)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:success] = t(:create, scope: %i[flash project success], project: @project.name)
      redirect_to :my_social_projects
    else
      flash[:error] = t(:new, scope: %i[flash project error])
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      flash[:success] = t(:edit, scope: %i[flash project success], project: @project.name)
      redirect_to :my_social_projects
    else
      flash[:error] = t(:edit, scope: %i[flash project error])
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    flash[:success] = t(:destroy, scope: %i[flash project success], project: @project.name)
    redirect_to :my_social_projects
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def validate_user_type
    return if social_company?

    flash[:error] = t(:user_type, scope: %i[flash project error])
    redirect_to root_path
  end
end
