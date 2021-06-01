class Comment < ApplicationRecord
    belongs_to :issues
    belongs_to :users
    validates :content, presence: true
end
