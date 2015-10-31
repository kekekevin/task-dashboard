require 'rails_helper'

RSpec.describe SwimLanesController, type: :controller do

  describe "GET #show" do

    it "should return the specified swim lane" do
      swim_lane = SwimLane.create({name: "swim lane"})

      get :show, id: swim_lane.id

      expect(response.body).to eq ActiveModel::SerializableResource.new(SwimLane.last).to_json
    end

  end

end
