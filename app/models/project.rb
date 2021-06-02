class Project < ApplicationRecord
    has_many :issues
    validates :summary, presence: true
    validates :description, presence: true
    validates :title, presence: true
end
