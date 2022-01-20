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
      expect(response.body).to include('list of users')
    end
  end

  describe 'USERS GET #show' do
    before(:example) { get('/users/show') }

    it 'return 200 for correct server' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the correct show template' do
      expect(response).to render_template(:show)
    end

    it 'shows correct body content of USERS#show' do
      expect(response.body).to include('show user details by index id')
    end
  end
end
