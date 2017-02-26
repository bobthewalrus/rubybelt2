class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :name, :email, :password, presence: true
    validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, confirmation: true, length: { in: 9..100}
    validates :name, length: { in: 3..100}
  has_secure_password

end
