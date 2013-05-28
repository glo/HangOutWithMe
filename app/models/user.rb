# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  phone            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  password_digest  :string(255)
#  provider         :string(255)
#  uid              :integer
#  image            :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#

class User < ActiveRecord::Base
#  attr_accessible :email, :name, :phone, :password, :password_confirmation
  attr_accessible :email, :name, :uid, :provider, :phone
    
#  has_secure_password
  
#  before_save { |user| user.email = email.downcase }
  
  # Below is from RailsCast #360 on omniauth-facebook
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      unless auth["info"].blank? 
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
  end
  
  has_many :events, dependent: :destroy
  
  # TODO: Turn phone from string into integer
#   validates :phone, presence: true, length: {is: 10}
  

  validates :name, presence: true, length: {maximum: 50} 
  
# TODO: GET EMAIL FROM FACEBOOK, THEN ADD BACK VALIDATES EMAIL  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#  validates :email, presence: true, 
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
 
 # validates :password, presence: true, length: { minimum: 6 }
 # validates :password_confirmation, presence: true
 
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Event.where("user_id = ?", id)
  end
 
end
