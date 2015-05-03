class HomeController < ApplicationController
  def index
  	@article=Article.all
  end

  def my_articles
  	user_id=User.find_by_email(session[:user_id]).id
  	@my_articles=Article.where(:user_id => user_id)
  end
  
end
