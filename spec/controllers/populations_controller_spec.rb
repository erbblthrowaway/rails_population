require 'rails_helper'

RSpec.describe PopulationsController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :index, params: { year: "1900" }
      expect(response).to have_http_status(:success)
    end

    it "returns a population for a date" do
      year = 1900
      get :index, params: { year: year }
      expect(response.content_type).to eq "text/html"
      expect(response.body).to match /Population: #{PopulationService.get_population(year)[:population]}/im
    end
  end
end
