require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "POST #create" do

    it "returns the created task" do
      post :create, task: {
        summary: "summary",
        description: "description",
        due_date: Time.now
      }, format: :json

      expect(response.body).to eq ActiveModel::SerializableResource.new(Task.last).to_json
    end

  end

  describe "GET #show" do

    it "returns the specified task" do
      task = Task.create({id: 1})
      get :show, id: task.id

      expect(response.body).to eq ActiveModel::SerializableResource.new(task).to_json
    end

  end

end
