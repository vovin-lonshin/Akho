class Designer < ActiveRecord::Base
  before_save {email.downcase! }
  has_many :daemons
  
  validates :name, presence: true, length: { maximum: 51}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
              
  has_secure_password
  validates :password, length: { minimum: 6 }
            
end
