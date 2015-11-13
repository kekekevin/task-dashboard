require 'rails_helper'

RSpec.describe Task, type: :model do

  describe "#assign" do
    it "assigns itself to the board" do
      board = Board.create.with_default_lanes
      task = Task.new(board: board, due_date: Time.now)

      task.assign

      expect(task.swim_lane).to be
    end
  end
end
