class User < ApplicationRecord
    has_many :posts

    validates :username, presence: true
    validates :email, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
