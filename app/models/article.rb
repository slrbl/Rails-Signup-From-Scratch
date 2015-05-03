class Article < ActiveRecord::Base
	validates_presence_of :title, :content, :user_id
end
