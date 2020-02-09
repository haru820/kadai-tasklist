class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Registered New Task!!'
      redirect_to tasks_url
    else
      flash.now[:danger] = 'Failure Registration...'
      render :new
    end
    
    
  end
  
  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = 'Modified your Task!!'
      redirect_to task_path(@task)
    else
      flash.now[:danger] = 'Failure Updating...'
      render :new
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'Task has deleted!'
    redirect_to tasks_url
  end
  
  private
  
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

end
