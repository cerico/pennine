class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter, :facebook, :google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :bookmarks
  has_many :trails

  def self.find_for_google_oauth2(auth, signed_in_user=nil)
    if user = signed_in_user || User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.photo = auth.info.image
      user.save
      user

    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.photo = auth.info.image
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        # user.skip_confirmation!
      end
    end
  end


  def self.find_for_twitter(auth, signed_in_user=nil)
    twitter_email = auth.info.nickname.downcase + "@twitter.com"
    if user = signed_in_user || User.find_by_email(twitter_email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.photo = auth.info.image
      user.save
      user
    else
      
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.photo = auth.info.image
        user.email = twitter_email
        user.password = Devise.friendly_token[0,20]
        #user.skip_confirmation!
        
      end
    end
  end

  def self.find_for_facebook(auth, signed_in_user=nil)
    facebook_email = auth.info.email
    if user = signed_in_user || User.find_by_email(facebook_email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.photo = auth.info.image
      user.save
      user
    else
      
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.photo = auth.info.image
        user.email = twitter_email
        user.password = Devise.friendly_token[0,20]
        #user.skip_confirmation!
        
      end
    end
  end
end
