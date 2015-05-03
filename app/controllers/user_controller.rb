class UserController < ApplicationController

	#get 'user/signup'
	def signup
		@user=User.new
	end

	#post 'user/new_user'
	def new_user
		params[:user].permit! #replace attrb_accessible in rails 4

		if User.find_by_email(params[:user][:email]) or User.find_by_username(params[:user][:username])
			flash[:notice_signup]="Email or Username is already taken"
			redirect_to '/user/signup'
		else
			if User.new(params[:user]).signup()
				flash[:notice_signup]="Signup succeded"
				redirect_to '/user/signin'
			else
				flash[:notice_signup]="Signup failed"	
				redirect_to '/user/signup'	
			end
		end
		
	end

	#get 'user/signin'
	def signin
		@user=User.new
	end

	#post 'user/new_session'
	def new_session
		params[:user].permit! #replace attrb_accessible in rails 4
		@user=User.find_by_email(params[:user][:email])

		if @user
			password=params[:user][:password]
			if @user.signin(password)
				session[:user_id]=@user.email
				flash[:notice]='You are successfully signed in'
				redirect_to :root
			else
				flash[:notice]='Wrong password, please try again'
				redirect_to '/user/signin'
			end
		else
			flash[:notice]='No account foudn with this email, please check your parameters'
			redirect_to '/user/signin'
		end
	end
	#get 'user/signout'
	def signout
		session[:user_id]=nil
		flash[:notice]="You are successfully signed out"
		redirect_to :root
	end
end


  
  

  
