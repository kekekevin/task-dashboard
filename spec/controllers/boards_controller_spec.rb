require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  let(:board) { {name: "board"} }

  describe "GET #index" do
    it "should retrieve all boards" do
      Board.create(board)

      get :index

      expect(response.body).to eq ActiveModel::SerializableResource.new(Board.all).to_json
    end
  end

  describe "GET #show" do
    it "should retrieve the specified board" do
      board = Board.create(board)

      get :show, id: board.id

      expect(response.body).to eq ActiveModel::SerializableResource.new(Board.last).to_json
    end
  end

end
