class User < ActiveRecord::Base

  has_secure_password
  valdiates: :email, presence: true, uniqueness: { case_sensitive: false }

end
