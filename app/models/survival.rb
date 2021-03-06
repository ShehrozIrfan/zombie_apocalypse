class Survival < ApplicationRecord
    has_many :items
    has_one_attached :avatar

    before_save { email.downcase }
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :age, presence: true
    validates :gender, presence: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
end
