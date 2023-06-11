# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    let(:user) { User.create(email: 'test@example.com', password: 'password') }

    context 'when user is authenticated' do
      before do
        sign_in user
      end
    end
  end
end
