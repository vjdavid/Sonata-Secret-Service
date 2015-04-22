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

end

