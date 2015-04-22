require 'rails_helper'
require 'pry'

RSpec.describe ProjectsController, :type => :controller do

  describe "GET #index" do
    it "list all projects from one agent" do
       agent = FactoryGirl.create(:agent)

      3.times do 
        FactoryGirl.create(:project, agent_id: agent.id) 
      end

      get :index, { agent_id: agent.id }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.count).to eq(3)
    end
  end

  
  describe "GET #show" do

    it "return a object" do
      agent = FactoryGirl.create(:agent)
      project = FactoryGirl.create(:project, agent_id: agent.id)

      get :show, { id: project.id, agent_id: agent.id }
      res = JSON.parse(response.body)
      expect(project.id).to eq(res["id"])
    end

    it "return an object with correct id" do
      skip "here are a bug" do
        agent = FactoryGirl.create(:agent)
        project = FactoryGirl.create(:project, agent_id: agent.id)
        get :show, { id: project.id, agent_id: agent.id }
        res = JSON.parse(response.body)

        expect(agent.id).to eq(res["agent_id"]) 
        true.should be(true)
      end
    end

  end

  describe "POST #create" do
    it "create one object" do
      agent = FactoryGirl.create(:agent)
      project = FactoryGirl.create(:project, agent_id: agent.id)
      post :create, { id: project.id, agent_id: agent.id }
      res = JSON.parse(response.body)
      expect(agent.id).to eq(res["agent_id"])
    end
  end

  describe "PUT #update" do
    it "update object" do
      agent = FactoryGirl.create(:agent)
      project = FactoryGirl.create(:project, agent_id: agent.id)

      old_name = project.name

      put :update,  { id: project.id, agent_id: agent.id, name: "Sample" }
      parsed_response = JSON.parse(response.body)
      new_name = parsed_response["name"]
      expect(old_name).not_to eq(new_name)
    end
  end

  describe "DELETE #destroy" do 
    it "delete object" do
      skip "pendient" do
      agent = FactoryGirl.create(:agent)
      project = FactoryGirl.create(:project, agent_id: agent.id)
      expect {
        delete :destroy, id: project.id, agent_id: agent.id
      }.to change(Project.count).by(-1)
      true.shold be(true)
      end
    end
  end

end
