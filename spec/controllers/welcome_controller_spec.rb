require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "renders the home template" do
      get:home
      expect(response).to render_template("home")
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get:index
      expect(response).to render_template("index")
    end
  end

end
