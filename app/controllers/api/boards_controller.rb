class Api::BoardsController < ApplicationController

  def index
    @boards = Board.all

    render json: @boards
  end

  def show
    @board = Board.find(params[:id])

    render json: @board
  end

  def create
    @board = Board.create(board_params)

    render json: @board
  end

  private

  def board_params
    params.require(:board).permit(:name, :description, :time_zone)
  end
end
