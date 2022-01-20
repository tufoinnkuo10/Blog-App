require 'rails_helper'

RSpec.describe 'POSTS', type: :request do
  describe 'GET POSTS #index' do
    before(:each) { get user_posts_path user_id: 20 }

    it 'server return 200 then server is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'template does rendering correctly' do
      expect(response).to render_template(:index)
    end

    it 'shows body content of index' do
      expect(response.body).to include('show user posts details id')
    end
  end

  describe 'GET POSTS #show' do
    before(:example) { get('/users/15/posts/20') }

    it 'return 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the correct show template' do
      expect(response).to render_template(:show)
    end

    it 'shows body content of posts show' do
      expect(response.body).to include('show user posts details')
    end
  end
end
