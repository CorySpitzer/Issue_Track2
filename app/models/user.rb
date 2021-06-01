class User < ApplicationRecord
    has_and_belongs_to_many :issues
    has_many :comments
    validates :role, presence: true
    validates :username, presence: true
end
