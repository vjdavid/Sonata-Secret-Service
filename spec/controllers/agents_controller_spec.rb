require 'rails_helper'
require 'pry'

RSpec.describe AgentsController, :type => :controller do

  describe "GET #index" do
    it "list all agents" do
      FactoryGirl.create(:agent)
      agents = Agent.all
      get :index
      expect(agents).to eq(agents)
    end
  end

  describe "GET #show" do
    it "list object" do
     agent = FactoryGirl.create(:agent)
     get :show, id: agent
     expect(assigns(:agent)).to eq(agent)
    end
  end

  describe "PUT #update" do
    it "update an object" do
      agent = FactoryGirl.create(:agent)
      put :update, id: agent, agent: FactoryGirl.attributes_for(:agent, name: "Sample")
      agent.reload
      expect(agent.name).to eql("Sample")
    end
  end

  describe "DELETE #destroy" do
    it "destroy one object" do
      agent = FactoryGirl.create(:agent)
      expect { delete :destroy,
      :id => agent.id }.to change(Agent, :count).by(-1)
    end
  end

  describe "POST #create" do
    it "create one object" do
      expect{
        post :create, agent: FactoryGirl.attributes_for(:agent)
      }.to change(Agent, :count).by(1)
    end
  end

end
