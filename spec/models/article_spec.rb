require 'rails_helper'

RSpec.describe Article, type: :model do
	before :all do
		@article = Article.new(:title => "test_article_title", :content => "test_article_content", :user_id => 1 )# "Title", "Author", :category
	end

	it "is invalid without a title" do
		@article.title.should_not eq nil
	end

	it "is invalid without a content" do
		@article.content.should_not eq nil
	end

	it "is invalid without a user_id" do
		@article.user_id.should_not eq nil
	end

	describe "#new" do
		it "takes three parameters and returns an Article object" do
				@article.should be_an_instance_of Article
		end
	end





end
