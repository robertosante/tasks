class TasksController < ApplicationController
  before_action :authenticate
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:filter]
      tasks = @current_user.tasks.filter(params[:filter])
    else
      tasks = @current_user.tasks
    end
    render json: tasks
  end

  def show
    if @current_user == @task.user
      render json: @task 
    else
      render json: { message: "Not Authorized" }, status: :forbidden
    end
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
    if @current_user == @task.user
      if @task.update_attributes(task_params)
        render json: @task, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity 
      end
    end
  end

  def destroy
    if @current_user == @task.user
      @task.destroy
      head :no_content
    else
      render json: { message: "Unprocessable" }, status: :unprocessable_entity
    end
  end
  
  private

   # Use callbacks to hsare common setup or constraints between actions.
   def set_task
      @task = Task.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def task_params
      params.require(:task).permit(:description, :website, :status, :user_id)
   end

end

