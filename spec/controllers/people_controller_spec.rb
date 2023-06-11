require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'POST #import' do
    context 'when no file is uploaded' do
      it 'redirects to the root path with an alert' do
        post :import
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('No file selected')
      end
    end
  end

  describe 'GET #clear' do
    it 'destroys all people records' do
      expect(Person).to receive(:destroy_all)
      get :clear
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('All people deleted')
    end
  end
end
