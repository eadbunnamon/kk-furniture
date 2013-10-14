require 'spec_helper'

describe RoomsController do

  describe "index" do
    it "everybody can view rooms index" do
      get :index

      response.should be_success
      response.should render_template("index")
    end
  end

  describe "show" do
    it "everybody can view room show page" do
      room = FactoryGirl.create(:room)

      get :show, id: room.id

      response.should be_success
      response.should render_template("show")
    end
  end
end