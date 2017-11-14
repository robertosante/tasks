class User < ApplicationRecord

  has_secure_password

  has_many :tasks
  validates_presence_of :email, :password_digest
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email

end
