class User < ApplicationRecord
  validates :name, presence: true
  validates_uniquenes_of :email
  validates_format_of :email, :with => /@/
  # may need to add ',allow_nil: true' to password validation
  # to allow has_secure_password to hash password and save
  validates :password, length: { minimum: 6 }

  has_secure_password

end
