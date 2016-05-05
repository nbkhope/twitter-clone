class User < ActiveRecord::Base
  has_many :tweets

  validates :handle, uniqueness: true, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_hash, presence: true

end
