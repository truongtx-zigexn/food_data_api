class User < ApplicationRecord
    has_one :physical_stat
    has_many :plans
end
