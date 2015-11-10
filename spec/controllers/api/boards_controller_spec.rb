require 'rails_helper'

RSpec.describe Api::BoardsController, type: :controller do

  let(:board) { { name: "board", time_zone: "Central Time (US & Canada)", description: "description" } }

  describe "GET #index" do
    it "should retrieve all boards" do
      Board.create(board)

      get :index

      expect(response.body).to eq '{"boards":[{"id":1,"name":"board","time_zone":"Central Time (US \\u0026 Canada)","description":"description","swim_lane_ids":[1,2,3,4]}],"swim_lanes":[{"id":1,"name":"Today","days":1,"order":1,"task_ids":[]},{"id":2,"name":"Tomorrow","days":2,"order":2,"task_ids":[]},{"id":3,"name":"One Week","days":7,"order":3,"task_ids":[]},{"id":4,"name":"One Month","days":30,"order":4,"task_ids":[]}]}'
    end
  end

  describe "GET #show" do
    it "should retrieve the specified board" do
      existing_board = Board.create(board)

      get :show, id: existing_board.id

      expect(response.body).to eq '{"board":{"id":1,"name":"board","time_zone":"Central Time (US \\u0026 Canada)","description":"description","swim_lane_ids":[1,2,3,4]},"swim_lanes":[{"id":1,"name":"Today","days":1,"order":1,"task_ids":[]},{"id":2,"name":"Tomorrow","days":2,"order":2,"task_ids":[]},{"id":3,"name":"One Week","days":7,"order":3,"task_ids":[]},{"id":4,"name":"One Month","days":30,"order":4,"task_ids":[]}]}'
    end
  end

  describe "POST #create" do
    it "should create a new board" do
      expect {
        post :create, board: board, format: :json
      }.to change{ Board.count }.by 1
    end

    it "should return the created board" do
      post :create, board: board, format: :json

      expect(response.body).to eq '{"board":{"id":1,"name":"board","time_zone":"Central Time (US \\u0026 Canada)","description":"description","swim_lane_ids":[1,2,3,4]},"swim_lanes":[{"id":1,"name":"Today","days":1,"order":1,"task_ids":[]},{"id":2,"name":"Tomorrow","days":2,"order":2,"task_ids":[]},{"id":3,"name":"One Week","days":7,"order":3,"task_ids":[]},{"id":4,"name":"One Month","days":30,"order":4,"task_ids":[]}]}'
    end
  end

end
