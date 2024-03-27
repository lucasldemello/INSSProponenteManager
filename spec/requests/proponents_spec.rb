# spec/controllers/proponents_controller_spec.rb
require 'rails_helper'

RSpec.describe ProponentsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new proponent' do
        expect do
          post :create, params: { proponent: FactoryBot.attributes_for(:proponent) }
        end.to change(Proponent, :count).by(1)
      end

      it 'redirects to the proponents index page' do
        post :create, params: { proponent: FactoryBot.attributes_for(:proponent) }
        expect(response).to redirect_to(proponents_path)
        expect(flash[:notice]).to eq('Proponent created successfully!')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new proponent' do
        expect do
          post :create, params: { proponent: FactoryBot.attributes_for(:proponent, name: nil) }
        end.to_not change(Proponent, :count)
      end

      it 'renders the new template' do
        post :create, params: { proponent: FactoryBot.attributes_for(:proponent, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    let(:proponent) { FactoryBot.create(:proponent) }

    it 'returns a success response' do
      get :show, params: { id: proponent.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    let(:proponent) { FactoryBot.create(:proponent) }

    it 'returns a success response' do
      get :edit, params: { id: proponent.id }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    let(:proponent) { FactoryBot.create(:proponent) }

    context 'with valid parameters' do
      it 'updates the proponent' do
        patch :update, params: { id: proponent.id, proponent: { name: 'Updated Name' } }
        proponent.reload
        expect(proponent.name).to eq('Updated Name')
      end

      it 'redirects to the proponents index page' do
        patch :update, params: { id: proponent.id, proponent: { name: 'Updated Name' } }
        expect(response).to redirect_to(proponents_path)
        expect(flash[:notice]).to eq('Proponent updated successfully!')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the proponent' do
        patch :update, params: { id: proponent.id, proponent: { name: nil } }
        proponent.reload
        expect(proponent.name).to_not be_nil
      end

      it 'renders the edit template' do
        patch :update, params: { id: proponent.id, proponent: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:proponent) { FactoryBot.create(:proponent) }

    it 'destroys the proponent' do
      expect do
        delete :destroy, params: { id: proponent.id }
      end.to change(Proponent, :count).by(-1)
    end

    it 'redirects to the proponents index page' do
      delete :destroy, params: { id: proponent.id }
      expect(response).to redirect_to(proponents_path)
      expect(flash[:notice]).to eq('Proponent was successfully deleted.')
    end
  end

  describe 'GET #report' do
    it 'returns a success response' do
      get :report
      expect(response).to be_successful
    end
  end
end
