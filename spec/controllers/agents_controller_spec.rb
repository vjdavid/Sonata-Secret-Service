require 'rails_helper'

RSpec.describe AgentsController, :type => :controller do

  describe "GET #index" do
    it "list all agents" do
      agent = Agent.all

    end
  end

end
