class User < ActiveRecord::Base

  before_save { self.email = email.downcase.strip }

  has_secure_password

  has_many :reviews

  validates :email,                 uniqueness:   true, presence: true
  validates :name,                  presence:     true
  validates :last_name,             presence:     true
  validates :password,              presence:     true, length: { minimum: 3 }
  validates :password_confirmation, presence:     true


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end
end
