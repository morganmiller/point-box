class User < ActiveRecord::Base
  has_secure_password
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  
  validates :username, presence: true,
                       uniqueness: true
  
  enum role: %w(default, admin)
  
  def admin?
    role == "admin"
  end
end
