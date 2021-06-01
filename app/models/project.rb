class Project < ApplicationRecord
    has_many :issues
    validates :summary, presence: true
    validates :description, presence: true
end
