class Comment < ApplicationRecord
    belongs_to :issues, optional: true
    belongs_to :users, optional: true
    # these 'optional: true's are necceasary to avoid
    # 'ActiveRecord::RecordInvalid: Validation failed: Issues must exist, Users must exist'
    # errors. See https://stackoverflow.com/questions/38983666/validation-failed-class-must-exist
    validates :content, presence: true
end
