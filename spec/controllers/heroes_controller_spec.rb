require 'rails_helper'

describe HeroesController, type: :controller do
  before  do
    request.headers['Authorization'] = 'Basic bXlfdXNlcjpteV9wYXNzd29yZA=='
  end

  let(:marvel_universe) { Universe.create(name: 'Marvel') }

  let(:valid_attributes) {
    {
      name:'Deadpool',
      real_name: 'Wade Wilson',
      species: 'Human',
      universe_id: marvel_universe.id
    }
  }

  let(:invalid_attributes) {
    {
      name: 'Deadpool',
      real_name: 'Wade Wilson',
      species: '',
      universe_id: marvel_universe.id
    }
  }

  let(:valid_session) { { authorization: 'Basic bXlfdXNlcjpteV9wYXNzd29yZA==' } }

  describe "GET #index" do
    it "assigns all heros as @heros" do
      hero = Hero.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:heros)).to eq([hero])
    end
  end

  describe "GET #show" do
    it "assigns the requested hero as @hero" do
      hero = Hero.create! valid_attributes
      get :show, params: {id: hero.to_param}, session: valid_session
      expect(assigns(:hero)).to eq(hero)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Hero" do
        expect {
          post :create, params: valid_attributes, session: valid_session
        }.to change(Hero, :count).by(1)
      end

      it "assigns a newly created hero as @hero" do
        post :create, params: valid_attributes, session: valid_session
        expect(assigns(:hero)).to be_a(Hero)
        expect(assigns(:hero)).to be_persisted
      end

      it "responds with created(201) status" do
        post :create, params: valid_attributes, session: valid_session
        expect(response.status).to eq(201)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved hero as @hero" do
        post :create, params: invalid_attributes, session: valid_session
        expect(assigns(:hero)).to be_an_instance_of(Hero)
      end

      it "retrieves unprocessable_entity status" do
        post :create, params: invalid_attributes, session: valid_session
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { real_name: 'Wade Wilson Wilson' }
      }

      it "updates the requested hero" do
        hero = Hero.create! valid_attributes
        put :update, params: { id: hero.to_param }.merge(new_attributes), session: valid_session
        hero.reload
        expect(assigns(:hero).real_name).to_not eq('Wade Wilson')
      end

      it "assigns the requested hero as @hero" do
        hero = Hero.create! valid_attributes
        put :update, params: { id: hero.to_param }.merge(valid_attributes), session: valid_session
        expect(assigns(:hero)).to eq(hero)
      end

      it "responds with status 200" do
        hero = Hero.create! valid_attributes
        put :update, params: { id: hero.to_param }.merge(valid_attributes), session: valid_session
        expect(response.status).to eq(200)
      end
    end

    context "with invalid params" do
      it "assigns the hero as @hero" do
        hero = Hero.create! valid_attributes
        put :update, params: { id: hero.to_param }.merge(invalid_attributes), session: valid_session
        expect(assigns(:hero)).to eq(hero)
      end

      it "retrieves unprocessable_entity status" do
        hero = Hero.create! valid_attributes
        put :update, params: { id: hero.to_param }.merge(invalid_attributes), session: valid_session
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested hero" do
      hero = Hero.create! valid_attributes
      expect {
        delete :destroy, params: { id: hero.to_param }, session: valid_session
      }.to change(Hero, :count).by(-1)
    end

    it "responds with no-content status" do
      hero = Hero.create! valid_attributes
      delete :destroy, params: { id: hero.to_param }, session: valid_session
      expect(response.status).to eq(204)
    end
  end

end
