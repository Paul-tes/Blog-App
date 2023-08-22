require 'rails_helper'
require 'nokogiri'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'includes the correct placeholder text in the respose body' do
      get '/users/123'
      html = Nokogiri::HTML(response.body)
      h1_element = html.at('h1')
      expect(h1_element.text).to include('This is detail of the user ')
    end
  end
end
