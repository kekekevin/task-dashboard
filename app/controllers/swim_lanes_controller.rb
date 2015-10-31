class SwimLanesController < ApplicationController

  def show
    @swim_lane = SwimLane.find(params[:id])

    render json: @swim_lane
  end

end
