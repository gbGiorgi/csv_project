# frozen_string_literal: true

# spec/models/user_spec.rb
require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(email: 'test@example.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(email: nil, password: 'password')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(email: 'test@example.com', password: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'Devise modules' do
    it 'includes database_authenticatable module' do
      expect(User.devise_modules).to include(:database_authenticatable)
    end
  end
end
