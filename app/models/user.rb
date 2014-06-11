class User < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  has_many :hospitals, through: :favorites

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :dob, presence: true
  # validates :gender, presence: true
  validates :email, presence: true, uniqueness: true
  self.has_secure_password()
end