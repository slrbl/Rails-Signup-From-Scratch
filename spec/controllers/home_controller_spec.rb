require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe "GET #index" do
		it "renders the :index view" do
			get :index
			response.should render_template :index
		end
  	end

  	describe "GET #my_articles" do
		it "renders the :my_articles view" do
			get :my_articles
			response.should render_template :my_articles
		end
  	end
	

end
