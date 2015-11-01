require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  let(:board) { {name: "board", time_zone: "America/Chicago", description: "description"} }

  describe "GET #index" do
    it "should retrieve all boards" do
      Board.create(board)

      get :index

      expect(response.body).to eq '{"boards":[{"id":1,"name":"board","time_zone":"America/Chicago","description":"description","swim_lane_ids":[]}]}'
    end
  end

  describe "GET #show" do
    it "should retrieve the specified board" do
      existing_board = Board.create(board)

      get :show, id: existing_board.id

      expect(response.body).to eq '{"board":{"id":1,"name":"board","time_zone":"America/Chicago","description":"description","swim_lane_ids":[]},"swim_lanes":[]}'
    end
  end

end
