class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true,
                       uniqueness: true
  
  enum role: %w(default, admin)
  
  def admin?
    role == "admin"
  end
end
