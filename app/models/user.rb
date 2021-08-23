# email:string
# password_digest:string
#
# password:string - virtual attribute
# password:confirmation - virtual attribute

class User < ApplicationRecord

  has_many :twitter_accounts
  has_many :tweets
  has_secure_password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/,  message: "Must be a valid email adress"}
end
