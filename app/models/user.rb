class User < ActiveRecord::Base
  
  has_many :posts, :dependent => :destroy

  validates_presence_of :username
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         
=begin
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
	    data = access_token.info
	    user = Admin_user.where(:email => data["email"]).first

	    # Uncomment the section below if you want users to be created if they don't exist
	    unless user
	         user = User.create(username: data["name"],
	            email: data["email"],
	            password: Devise.friendly_token[0,20]
	         )
	     end
	    user
	end
=end
end
