class User < ActiveRecord::Base
  attr_accessible :email, :full_name, :password, :password_confirmation
  has_secure_password

end