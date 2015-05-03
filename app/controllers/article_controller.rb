class ArticleController < ApplicationController
	#get 'article/create'
	def create
		if session[:user_id]
		@article=Article.new
	else
		flash[:signin_required_notice]="Please login before adding articles"
		redirect_to "/user/signin"
	end
  	end

  	#post 'article/save'
  	def save
  		params[:article].permit! #replace attrb_accessible in rails 4
  		@article = Article.new(params[:article])
  		@article.user_id=User.find_by_email(session[:user_id]).id
  		@article.save
  		redirect_to :root
  	end


  	#get 'article/edit'
  	def edit
  		@article=Article.find(params[:article_id])
  	end

  	#post 'article/update'
  	def update
  		#@article=params[:artcile]
  		params[:article].permit!
  		Article.update(params[:article][:id],params[:article])
  		#@article.save
  		redirect_to :root
  	end
  	

  	#delete 'article/delete'
  	def delete
  		Article.find(params[:article_id]).destroy
  		redirect_to :root
  	end

  	#post 'article/destroy'
  	def destroy
  	end
end
