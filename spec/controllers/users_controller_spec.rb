require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    let!(:user) { FactoryBot.create :user }

    it "return a success response" do
      expect(response).to be_successful
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end
