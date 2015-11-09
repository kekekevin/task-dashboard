require 'rails_helper'

RSpec.describe Board, type: :model do

  describe "initialize" do
    it "should create four swim lanes" do
      expect(subject.swim_lanes.length).to eq 4
    end
  end

  describe "today's swim lane" do
    subject { Board.new.swim_lanes.find { |lane| lane.days == 1 } }

    it { is_expected.to have_attributes(name: 'Today', order: 1) }
  end

  describe "tomorrow's swim lane" do
    subject { Board.new.swim_lanes.find { |lane| lane.days == 2 } }

    it { is_expected.to have_attributes(name: 'Tomorrow', order: 2) }
  end

  describe "one week's swim lane" do
    subject { Board.new.swim_lanes.find { |lane| lane.days == 7 } }

    it { is_expected.to have_attributes(name: 'One Week', order: 3) }
  end

  describe "one month's swim lane" do
    subject { Board.new.swim_lanes.find { |lane| lane.days == 30 } }

    it { is_expected.to have_attributes(name: 'One Month', order: 4) }
  end

end
