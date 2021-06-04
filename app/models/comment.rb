class Comment < ApplicationRecord
    belongs_to :issues, optional: true
    belongs_to :users, optional: true
    validates :content, presence: true
end
