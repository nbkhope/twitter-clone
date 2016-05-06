class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets

  validates :handle, uniqueness: true, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(handle, password)
    user = User.find_by(handle: handle)
    if user && user.password == password
      user
    else
      nil
    end
  end

end
