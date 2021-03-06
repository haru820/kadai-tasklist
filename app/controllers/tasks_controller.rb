class TasksController < ApplicationController
  before_action :require_user_logged_in #全てのアクションでログイン必須！, only: [:show, :new, :edit]
  #correct_Userがあり@taskの二重定義になっているため不要
  #before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  #include SessionsHelper
  
  def index
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
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
  
  #correct_Userがあり@taskの二重定義になっているため不要
  #def set_task
  #  @task = Task.find(params[:id])
  #end
  
  #Current_User Only
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

end
