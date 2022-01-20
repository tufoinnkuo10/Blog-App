require 'rails_helper'

RSpec.describe 'POSTS', type: :request do
  describe 'GET #index' do
    before(:each) { get user_posts_path user_id: 20 }

    it 'server return 200 then server is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'template does rendering correctly' do
      expect(response).to render_template(:index)
    end

    it 'shows body content of index' do
      expect(response.body).to include('<h1>users posts</h1>')
    end
  end

 