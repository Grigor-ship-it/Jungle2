class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password_digest, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true,length: { minimum: 6 }
  validates_confirmation_of :password
 
 def authenticate_with_credentials(password)
  
  password1 = password.strip
 
   return self.authenticate(password1)

 end

end
