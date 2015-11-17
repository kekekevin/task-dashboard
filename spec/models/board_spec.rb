require 'rails_helper'

RSpec.describe Board, type: :model do

  describe "#with_default_lanes" do
    let(:board) { Board.create.with_default_lanes }

    it "should create four swim lanes" do
      expect(board.swim_lanes.length).to eq 4
    end

    describe "today's swim lane" do
      subject { board.swim_lanes.find { |lane| lane.days == 1 } }

      it { is_expected.to have_attributes(name: 'Today', order: 1) }
    end

    describe "tomorrow's swim lane" do
      subject { board.swim_lanes.find { |lane| lane.days == 2 } }

      it { is_expected.to have_attributes(name: 'Tomorrow', order: 2) }
    end

    describe "one week's swim lane" do
      subject { board.swim_lanes.find { |lane| lane.days == 7 } }

      it { is_expected.to have_attributes(name: 'One Week', order: 3) }
    end

    describe "one month's swim lane" do
      subject { board.swim_lanes.find { |lane| lane.days == 30 } }

      it { is_expected.to have_attributes(name: 'One Month', order: 4) }
    end
  end

  describe '#assign' do
    let(:today) { SwimLane.new(days: 1) }

    let(:tomorrow) { SwimLane.new(days: 2) }

    let(:one_week) { SwimLane.new(days: 7) }

    let(:board) { Board.create(swim_lanes: [tomorrow, today, one_week]) }

    context "with a task with due date of today" do
      let(:task) { Task.new(board: board, due_date: Time.now.to_date) }

      it "should get assigned the swim lane today" do
        expect { board.assign task }.to change { today.tasks.size }.by 1
      end
    end

    context "with a task with due date of tomorrow" do
      let(:task) { Task.create(board: board, due_date: Time.now.to_date + 2.days) }

      it "should get assigned the swim lane tomorrow" do
        expect { board.assign task }.to change { tomorrow.tasks.size }.by 1
      end
    end

    context "with a task with due date between tomorrow and a week" do
      let(:task) { Task.create(board: board, due_date: Time.now.to_date + 5.days) }

      it "should get assigned the swim lane one week" do
        expect { board.assign task }.to change { one_week.tasks.size }.by 1
      end
    end
    
    context "with a task with due date greater than all swim lanes" do
      let(:task) { Task.create(board: board, due_date: Time.now.to_date + 30.days) }

      it "should get assigned the last swim lane " do
        expect { board.assign task }.to change { one_week.tasks.size }.by 1
      end
    end
    
  end
end
