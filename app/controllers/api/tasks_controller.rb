class Api::TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @task.assign
    @task.save

    render json: @task
  end

  def show
    @task = Task.find(params[:id])

    render json: @task
  end

  def update
    @task = Task.update(params[:id], task_params)
    @task.due_date = @task.swim_lane.date
    @task.save

    render json: @task
  end

  private

  def task_params
    params.require(:task).permit(:summary, :description, :due_date, :board_id, :swim_lane_id)
  end

end
