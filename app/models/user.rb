class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
  validates :password, length: { minimum: 6 }

  has_secure_password

end
