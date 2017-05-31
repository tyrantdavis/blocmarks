require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new
        expect(response).to render_template :new
    end

    it "instantiates @bookmark" do
        get :new
        expect(assigns(:bookmark)).not_to be_nil
    end
  end

  

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
