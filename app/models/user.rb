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
  
 # validates :name, presence: true, length: {maximum: 50} 
 # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 # validates :email, presence: true, 
 #                    format: { with: VALID_EMAIL_REGEX },
 #                    uniqueness: { case_sensitive: false }
 
 # TODO: Add the below phone validation back in when I have UI to ask for phone #
 # validates :phone, presence: true, length: {is: 10}
 
 # validates :password, presence: true, length: { minimum: 6 }
 # validates :password_confirmation, presence: true
end
