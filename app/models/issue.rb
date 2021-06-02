class Issue < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :comments
    belongs_to :projects, optional: true
    validates :summary, presence: true
    validates :description, presence: true
    validates :status, presence: true
end
