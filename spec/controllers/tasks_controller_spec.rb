require 'rails_helper'
require 'pry'

RSpec.describe TasksController, :type => :controller do

  describe "GET #index" do
    it "lists all tasks fron on projects" do
      project = FactoryGirl.create(:project)

      3.times do
        FactoryGirl.create(:task, project_id: project.id)
      end

      get :index, { project_id: project.id }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.count).to eq(3)
    end
  end

  describe "GET #show" do
    it "retrieve one task from project" do
      project = FactoryGirl.create(:project)
      task = FactoryGirl.create(:task, project_id: project.id)

      get :show, { id: task.id, project_id: project.id }
      res = JSON.parse(response.body)
      expect(task.id).to eq(res["id"])
    end

    it "give me an object with correct id" do
      skip "this is pending" do
        project = FactoryGirl.create(:project)
        task = FactoryGirl.create(:task, project_id: project.id)

        get :show, { id: task.id, project_id: project.id }
        res = JSON.parse(response.body)
        expect(project.id).to eq(res["project_id"])
        true.sholud be(true)
      end
    end
  end
  
  describe "POST #create" do
    it "create one object belongs to proyect" do
      project = FactoryGirl.create(:project)
      task = FactoryGirl.create(:task, project_id: project.id)
      post :create, { id: task.id, project_id: project.id }
      res = JSON.parse(response.body)
      expect(project.id).to eq(res["project_id"])
    end
  end

  describe "PUT #update" do
    it "update object" do
      project = FactoryGirl.create(:project)
      task = FactoryGirl.create(:task, project_id: project.id)
      
      old_name = task.name 

      put :update, { id: task.id, project_id: project.id, name: "Holis" }
      parsed_response = JSON.parse(response.body)
      new_name = parsed_response["name"]
      expect(old_name).not_to eq(new_name)
    end
  end

  describe "DELETE #destroy" do
    it "delete an object" do
      skip "pendient" do
        project = FactoryGirl.create(:project)
        task = FactoryGirl.create(:task, project_id: project.id )
        expect {
        delte :destroy, id: task.id, project_id: project.id
        }.to change(Task.count).by(-1)
        true.shold be(true)
      end
    end
  end

end

