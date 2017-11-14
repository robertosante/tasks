class TasksController < ApplicationController

  before_action :authenticate
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:filter]
      tasks = @current_user.tasks.where("website LIKE ? OR description LIKE ? ", params[:filter], params[:filter])
    else
      tasks = @current_user.tasks
    end
    render json: tasks
  end

  def show
    render json: @task
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = @current_user.tasks.new(task_params)

      if @task.save
        render json: @task, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
  end

  def update
    if @task.update_attributes(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

   def set_task
      @task = Task.find(params[:id])
   end

   def task_params
      params.require(:task).permit(:description, :website, :status, :user_id)
   end

end
