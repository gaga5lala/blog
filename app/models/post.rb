class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy

	validates :title, :presence => { :message => '請輸入標題'},
				:length => { :minimum => 3, :message => '最少3個字' }

	validates :body, :presence => { :message => '請輸入內容'},
				:length => { :minimum => 10, :message => '最少10個字' }
end
