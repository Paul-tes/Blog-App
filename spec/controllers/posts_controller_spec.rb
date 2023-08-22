require 'rails_helper'
require 'nokogiri'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users/23r3/posts'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users/23r3/posts'
      expect(response).to render_template('index')
    end

    it 'includes the correct placeholder text in the respose body' do
      get '/users/23r3/posts'
      html = Nokogiri::HTML(response.body)
      h1_element = html.at('h1')
      expect(h1_element.text).to include('This is lits posts')
    end
  end

  describe 'GET #show' do
    it 'should return the show page and its details' do
      get '/users/544/posts/123'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      html = Nokogiri::HTML(response.body)
      h1 = html.at('h1')
      expect(h1.text.strip).to eq('This is a Post')
    end
  end
end
