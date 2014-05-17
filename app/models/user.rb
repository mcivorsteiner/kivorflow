class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  validates_presence_of :email, :full_name, :password_digest
  has_secure_password

end