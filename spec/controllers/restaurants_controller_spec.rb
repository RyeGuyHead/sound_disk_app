require 'spec_helper'

describe RestaurantsController do
    
    
    render_views
    
    before(:each) do
        @base_title = "Ruby on Rails Tutorial Sample App"
    end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
    
    
    describe "Get 'index'" do
        before(:each) do
            get :index
        end
        
        it "should have a restaurants page" do
            response.should be_success
        end
        
        it "should have the right title" do
            response.should have_selector("title", :content => "#{@base_title} | Restaurants")
        end
        
    end

end
