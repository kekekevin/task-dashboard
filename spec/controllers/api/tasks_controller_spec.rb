require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
  let(:board) { Board.create.with_default_lanes }

  let(:task) { { summary: 'summary', description: 'description', due_date: Time.new(2015, 10, 31), board_id: board.id } }

  describe 'POST #create' do
    context 'when the task is created' do
      it 'returns the created task' do
        post :create, task: task, format: :json

        expect(response.body).to eq '{"task":{"id":1,"summary":"summary","description":"description","due_date":"2015-10-31","swim_lane_id":1}}'
      end

      it 'assigns the task' do
        post :create, task: task, format: :json

        expect(assigns(:task).swim_lane).to be
      end
    end
  end

  describe 'GET #show' do
    it 'returns the specified task' do
      existing_task = Task.create(task)
      get :show, id: existing_task.id

      expect(response.body).to eq '{"task":{"id":1,"summary":"summary","description":"description","due_date":"2015-10-31","swim_lane_id":null}}'
    end
  end

  describe 'PUT #update' do
    let(:swim_lane) { SwimLane.create(days: 2) }

    it 'adjusts the due_date' do
      task[:swim_lane_id] = swim_lane.id
      existing_task = Task.create(task)
      put :update, id: existing_task.id, task: task, format: :json

      expect(assigns(:task).due_date).to eq Time.now.to_date + 2.days
    end
  end

end
