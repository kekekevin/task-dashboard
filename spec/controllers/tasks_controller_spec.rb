require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:task) { { summary: "summary", description: "description", due_date: Time.now } }

  describe "POST #create" do

    it "returns the created task" do
      post :create, task: task, format: :json

      expect(response.body).to eq ActiveModel::SerializableResource.new(Task.last).to_json
    end

  end

  describe "GET #show" do

    it "returns the specified task" do
      existing_task = Task.create(task)
      get :show, id: existing_task.id

      expect(response.body).to eq ActiveModel::SerializableResource.new(existing_task).to_json
    end

  end

end
