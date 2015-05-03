class User < ActiveRecord::Base

	validates_presence_of :username, :email, :password_salt,:password_hash   #, :password
	
	validates_uniqueness_of :email
	validates_uniqueness_of :username 
	
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def signup()
		self.encrypt_password
		self.password=nil
		puts self
  		return self.save
  	end



  	def get_hash(attempt_password,attempt_password_salt)
		password_hash = BCrypt::Engine.hash_secret(attempt_password, attempt_password_salt)
		return password_hash
	end

	def signin(password)
		return self.get_hash(password,self.password_salt)==self.password_hash
	end


end
