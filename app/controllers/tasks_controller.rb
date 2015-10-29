class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @task.save

    render json: @task
  end

  def show
    @task = Task.find(params[:id])

    render json: @task
  end

  private

  def task_params
    params.require(:task).permit(:summary, :description, :due_date, :swim_lane_id)
  end

end
