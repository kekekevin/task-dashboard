require 'rails_helper'

RSpec.describe Api::BoardsController, type: :controller do

  let(:board) { { name: "board", time_zone: "Central Time (US & Canada)", description: "description" } }

  describe "GET #index" do
    it "should retrieve all boards" do
      Board.create(board)

      get :index

      expect(response.body).to eq '{"boards":[{"id":1,"name":"board","time_zone":"Central Time (US \\u0026 Canada)","description":"description","swim_lane_ids":[]}]}'
    end
  end

  describe "GET #show" do
    it "should retrieve the specified board" do
      existing_board = Board.create(board)

      get :show, id: existing_board.id

      expect(response.body).to eq '{"board":{"id":1,"name":"board","time_zone":"Central Time (US \\u0026 Canada)","description":"description","swim_lane_ids":[]}}'
    end
  end

  describe "POST #create" do
    it "should create a new board" do
      expect {
        post :create, board: board, format: :json
      }.to change { Board.count }.by 1
    end

    it "should return the created board with default lanes" do
      post :create, board: board, format: :json

      expect(response.body).to eq '{"board":{"id":1,"name":"board","time_zone":"Central Time (US \\u0026 Canada)","description":"description","swim_lane_ids":[1,2,3,4]}}'
    end
  end

end
