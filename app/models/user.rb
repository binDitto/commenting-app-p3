class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  def self.search(search)
    where("username LIKE ?", "%#{search}%")
  end

  has_secure_password
  before_save { self.password = password.downcase }

  validates :username, presence: true,
            length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false } # this is what caused all those seeded user login problems!!

  val_email_reg = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: val_email_reg }

  validates :password, presence: true,
            length: { minimum: 8, maximum: 25 }

  validates_confirmation_of :password, message: ": Passwords don't match!"
end
