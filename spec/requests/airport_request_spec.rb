require "rails_helper"

RSpec.describe "Airports API", type: :request do
  let(:parsed_body) { JSON.parse(response.body) }

  describe "GET /airports" do
    let!(:airports) { create_list(:airport, 2) }

    it "returns a list of airports" do
      get "/airports"

      expect(response).to have_http_status(:ok)
      expect(parsed_body.size).to eq(2)
      expect(parsed_body.map { |a| a["code"] }).to match_array(airports.map(&:code))
    end
  end

  describe "POST /airports" do
    context "with valid parameters" do
      let(:valid_params) { { airport: { code: "JFK", name: "John F. Kennedy International Airport", terminals: 5, city: "New York", country: "USA" } } }

      it "creates a new airport" do
        expect {
          post "/airports", params: valid_params
        }.to change(Airport, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(parsed_body["code"]).to eq(valid_params[:airport][:code])
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { airport: { code: "", name: "", terminals: nil } } }

      it "returns validation errors" do
        post "/airports", params: invalid_params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_body).to include("code", "name", "terminals")
      end
    end
  end

  describe "DELETE /airports" do
    context "when the airport exists" do
      let!(:airport) { create(:airport) }

      it "deletes the airport" do
        expect {
          delete "/airports/#{airport.id}"
        }.to change(Airport, :count).by(-1)

        expect(response).to have_http_status(:no_content)
      end
    end

    context "when the airport does not exist" do
      it "returns not found" do
        delete "/airports", params: { code: "MISSING" }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
