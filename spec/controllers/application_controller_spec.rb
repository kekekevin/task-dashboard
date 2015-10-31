require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "GET #index" do
    it "render index" do
      get :index

      expect(response).to render_template(:index)
    end
  end

end
