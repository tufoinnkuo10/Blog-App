require 'rails_helper'

RSpec.describe 'USERS', type: :request do
  describe 'USERS GET #index' do
    before(:example) { get('/users#index') }

    it 'server returns 200 then server is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'template is rendering correctly' do
      expect(response).to render_template(:index)
    end

    it 'shows correct body content of index' do
      expect(response.body).to include('<h1>list of users</h1>')
    end
  end
