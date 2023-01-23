require 'rails_helper'

RSpec.describe "News", type: :request do
  describe "GET /themes/news/:id" do
    before { get "/themes/news/:id" }
    it "returns http success" do
      expect(response).to have_http_status(302)
    end
    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
end
