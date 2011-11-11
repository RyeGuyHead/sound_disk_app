require 'spec_helper'

describe PagesController do
    render_views
    
    before(:each) do
        @base_title = "Music Coders Project"
    end
    
    
    describe "Get 'help'" do
        before(:each) do
            get :help
            end
        
        it "should have a help page" do
            response.should be_success
            end
        
        it "should have the right title" do
            response.should have_selector("title", :content => "#{@base_title} | Help")
            end
        end
    


    
    describe "GET 'home'" do
        
        describe "when not signed in" do
            
            before(:each) do
                get :home
            end
            
            it "should be successful" do
                response.should be_success
            end
            
            it "should have the right title" do
                response.should have_selector("title",
                                              :content => "#{@base_title} | Home")
            end
        end
        
        describe "when signed in" do
            
            before(:each) do
                @user = test_sign_in(Factory(:user))
                other_user = Factory(:user, :email => Factory.next(:email))
                other_user.follow!(@user)
            end
            
            it "should have the right follower/following counts" do
                get :home
                response.should have_selector("a", :href => following_user_path(@user),
                                              :content => "0 following")
                response.should have_selector("a", :href => followers_user_path(@user),
                                              :content => "1 follower")
            end
            
            it "should display how many microposts you've made" do
                get :home
                #posts = pluralize(@user.microposts.count, "micropost")
                response.should have_selector("a", :content => "microposts" )
            end
            
        end
    end
    
    describe "GET 'contact'" do
        it "should be successful" do
            get 'contact'
            response.should be_success
        end
        
        it "should have the right title" do
            get 'contact'
            response.should have_selector("title",
                                          :content =>
                                          "Ruby on Rails Tutorial Sample App | Contact")
        end
    end
    
    describe "GET 'about'" do
        it "should be successful" do
            get 'about'
            response.should be_success
        end
        
        it "should have the right title" do
            get 'about'
            response.should have_selector("title",
                                          :content =>
                                          "Ruby on Rails Tutorial Sample App | About")
        end
    end
end
