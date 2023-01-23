require 'rails_helper'

RSpec.describe "Themes", type: :request do
  describe "GET /themes/:id" do
    before { get "/themes/:id" }
    it "returns http 302" do
      expect(response).to have_http_status(302)
    end
    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
end
