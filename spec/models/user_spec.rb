require_relative '../rails_helper'

RSpec.describe User, type: :model do

	describe User do
		before :all do
			@user = User.new(:username => "test_useranme", :email => "test_email@test.com", :password => "test_password" )# "Title", "Author", :category
		end

		describe "#new" do
			it "takes three parameters and returns a User object" do
				@user.should be_an_instance_of User
			end
		end

		it "is invalid without a username" do
			@user.username.should_not eq nil
		end

		it "is invalid withoud email" do
			@user.email.should_not eq nil
		end

		it "is invalid withoud password" do
			@user.password.should_not eq nil
		end

		it "should not contain password_hash once instanciated " do
			@user.password_hash.should eq nil
		end

		it "should not contain password_hash once instanciated " do
			@user.password_hash.should eq nil
		end

		describe "#encrypt_password" do
			it "Should generate password_hash from password" do
				@user.encrypt_password.should_not eq false
				@user.password_salt.should_not eq nil
				@user.password_hash.should_not eq nil
			end
		end

		describe "#signup" do
			it "should save the user" do
				@user.signup.should eq true
			end
		end

		describe "#signin" do
			it "verify the provided password is the one of the identified user (using his email)" do
				@user.signin("test_password").should eq true
			end
		end


	end
end
