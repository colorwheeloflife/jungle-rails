class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  before_save { self.email = email.downcase.strip }


end
