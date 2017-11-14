class User < ApplicationRecord

  before_save :email_sanitize

  has_secure_password

  has_many :tasks
  validates_presence_of :email, :password_digest
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email
  
  private

    def email_sanitize
      self.email = self.email.strip.downcase
    end

end
