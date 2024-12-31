class User < ApplicationRecord
    has_one :physical_stat
    has_many :plans
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }
end
