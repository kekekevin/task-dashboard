require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:task) { { summary: "summary", description: "description", due_date: Time.new(2015, 10, 31) } }

  describe "POST #create" do

    it "returns the created task" do
      post :create, task: task, format: :json

      expect(response.body).to eq '{"task":{"id":1,"summary":"summary","description":"description","due_date":"2015-10-31"}}'
    end

  end

  describe "GET #show" do

    it "returns the specified task" do
      existing_task = Task.create(task)
      get :show, id: existing_task.id

      expect(response.body).to eq '{"task":{"id":1,"summary":"summary","description":"description","due_date":"2015-10-31"}}'
    end

  end

end
