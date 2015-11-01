require 'rails_helper'

RSpec.describe SwimLanesController, type: :controller do

  describe "GET #show" do

    it "should return the specified swim lane" do
      swim_lane = SwimLane.create({name: "swim lane", days: 7, order: 1})

      get :show, id: swim_lane.id

      expect(response.body).to eq '{"swim_lane":{"id":1,"name":"swim lane","days":7,"order":1,"task_ids":[]},"tasks":[]}'
    end

  end

end
