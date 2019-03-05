class User < ApplicationRecord
  validates_uniqueness_of :username
  has_secure_password
  has_secure_token :auth_token
  has_many :posts

  def invalidate_token
    self.update_columns(auth_token: nil)
  end

  def self.update id, info
      post = User.find(id)
      post.update!( email: info[:email], name: info[:name],
      instrument: info[:instrument], locations: info[:locations],
    bio: info[:bio])
  end

  def self.validate_login(username, password)
    user = find_by(username: username)
    if user && user.authenticate(password)
      user
    end
  end
end
