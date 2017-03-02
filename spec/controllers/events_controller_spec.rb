require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do
    it "should responds 200 when visiting" do
      get :index
      expect(response).to have_http_status(200)
    end

    # it 'should loads events' do
    #   event = Event.new
    #   event.save(validates: false)
    #   get :index
    #   get(assigns(:event)).to eq [event]
    # end
  end
end
