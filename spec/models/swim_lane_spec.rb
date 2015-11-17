require 'rails_helper'

RSpec.describe SwimLane, type: :model do
  describe '#date' do
    it 'should return the date plus days' do
      expect(SwimLane.new(days: 3).date).to eq Time.now.to_date + 3.days
    end    
  end
end

