class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Modified your Task!!'
      redirect_to task_path(@task)
    else
      flash.now[:danger] = 'Failure Updating...'
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Task has deleted!'
    redirect_to tasks_url
  end
  
  private
  #strong parameter
  def task_params
    params.require(:task).permit(:content)
  end

end
