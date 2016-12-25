require 'rails_helper'

RSpec.describe "Relations", type: :request do
  describe "GET /relations" do
    it "works! (now write some real specs)" do
      get relations_path
      expect(response).to have_http_status(200)
    end
  end
end
