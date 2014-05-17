class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :full_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates_presence_of :password, :on => :create
  
  has_secure_password

end