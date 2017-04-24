require 'rails_helper'

describe UniversesController, type: :controller do
  before  do
    request.headers['Authorization'] = 'Basic bXlfdXNlcjpteV9wYXNzd29yZA=='
  end

  let(:valid_attributes) {
    { name: 'Mario World' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:valid_session) { { authorization: 'Basic bXlfdXNlcjpteV9wYXNzd29yZA==' } }

  describe "GET #index" do
    it "assigns all universes as @universes" do
      universe = Universe.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:universes)).to eq([universe])
    end
  end

  describe "GET #show" do
    it "assigns the requested universe as @universe" do
      universe = Universe.create! valid_attributes
      get :show, params: { id: universe.to_param }, session: valid_session
      expect(assigns(:universe)).to eq(universe)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Universe" do
        expect {
          post :create, params: valid_attributes, session: valid_session
        }.to change(Universe, :count).by(1)
      end

      it "assigns a newly created universe as @universe" do
        post :create, params: valid_attributes, session: valid_session
        expect(assigns(:universe)).to be_a(Universe)
        expect(assigns(:universe)).to be_persisted
      end

      it "respond with status created(201)" do
        post :create, params: valid_attributes, session: valid_session
        expect(response.status).to eq(201)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved universe as @universe" do
        post :create, params: invalid_attributes, session: valid_session
        expect(assigns(:universe)).to be_a_new(Universe)
      end

      it "re-renders the 'new' template" do
        post :create, params: invalid_attributes, session: valid_session
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Mario & Peach World' }
      }

      it "updates the requested universe" do
        universe = Universe.create! valid_attributes
        put :update, params: { id: universe.to_param }.merge(new_attributes), session: valid_session
        universe.reload
        expect(assigns(:universe).name).to_not eq('Mario World')
      end

      it "assigns the requested universe as @universe" do
        universe = Universe.create! valid_attributes
        put :update, params: { id: universe.to_param }.merge(valid_attributes), session: valid_session
        expect(assigns(:universe)).to eq(universe)
      end

      it "respond with :ok status" do
        universe = Universe.create! valid_attributes
        put :update, params: { id: universe.to_param }.merge(valid_attributes), session: valid_session
        expect(response.status).to eq(200)
      end
    end

    context "with invalid params" do
      it "assigns the universe as @universe" do
        universe = Universe.create! valid_attributes
        put :update, params: { id: universe.to_param }.merge(invalid_attributes), session: valid_session
        expect(assigns(:universe)).to eq(universe)
      end

      it "respond with unprocessable_entity status" do
        universe = Universe.create! valid_attributes
        put :update, params: { id: universe.to_param }.merge(invalid_attributes), session: valid_session
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested universe" do
      universe = Universe.create! valid_attributes
      expect {
        delete :destroy, params: { id: universe.to_param }, session: valid_session
      }.to change(Universe, :count).by(-1)
    end

    it "responds with not_content status" do
      universe = Universe.create! valid_attributes
      delete :destroy, params: { id: universe.to_param }, session: valid_session
      expect(response.status).to eq(204)
    end
  end

end

