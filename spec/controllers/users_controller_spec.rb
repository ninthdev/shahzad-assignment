require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:user) { User.create(first_name: "Shahzad", last_name: "Tariq", dob: Date.new(1990, 1, 1), status: :active) }

    it "returns a success response" do
      get :show, params: { id: user.to_param }, format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: { first_name: "Shahzad", last_name: "Tariq", dob: Date.new(1990, 1, 1), status: :active } }, format: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :create, params: { user: { first_name: "Shahzad", last_name: "Tariq", dob: Date.new(1990, 1, 1), status: :active } }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do
        post :create, params: { user: { first_name: nil, last_name: nil, dob: nil, status: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    let(:user) { User.create(first_name: "Shahzad", last_name: "Tariq", dob: Date.new(1990, 1, 1), status: :active) }

    context "with valid params" do
      it "updates the requested user" do
        put :update, params: { id: user.to_param, user: { first_name: "Shahzad" } }, format: :json
        user.reload
        expect(user.first_name).to eq("Shahzad")
      end

      it "renders a JSON response with the user" do
        put :update, params: { id: user.to_param, user: { first_name: "Tariq" } }, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        put :update, params: { id: user.to_param, user: { dob: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { User.create(first_name: "Shahzad", last_name: "Tariq", dob: Date.new(1990, 1, 1), status: :active) }

    it "destroys the requested user" do
      expect {
        delete :destroy, params: { id: user.to_param }, format: :json
      }.to change(User, :count).by(-1)
    end
  end
end