require 'rails_helper'

RSpec.describe "ApplicationController", type: :request do
  describe "GET /" do
    it 'can load a route with a passing constraint' do
      get '/supported'
      aggregate_failures do
        expect(response).to have_http_status(200)
      end
    end
    it 'can\'t load a route with a failing constraint' do
      expect do
        get '/unsupported'
      end.to raise_error ActionController::RoutingError
    end
    it 'can load a wildcard route with a passing constraint' do
      get '/should/work'
      aggregate_failures do
        expect(response).to have_http_status(200)
      end
    end
    it 'can\'t load a wildcard rout with a failing constraint' do
      expect do
        get '/should/not/work'
      end.to raise_error ActionController::RoutingError
    end
    it 'can\'t load a page with a wildcard and failing constraint' do
      expect do
        get '/'
      end.to raise_error ActionController::RoutingError
    end
  end
end