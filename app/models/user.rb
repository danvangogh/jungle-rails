class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :email,                 uniqueness:   true
  validates :name,                  presence:     true
  validates :last_name,             presence:     true
  validates :password,              presence:     true
  validates :password_confirmation, presence:     true


  def self.authenticate_with_credentials(email, password)
    puts "holy moly, we are found"
    user = User.find_by_email(email)
    if user
      if user.authenticate(password)   # we're not using the answer to this question
        user
      else
        nil
      end
    else
      nil
    end
  end


end
