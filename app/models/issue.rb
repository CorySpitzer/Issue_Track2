class Issue < ApplicationRecord
    has_and_belongs_to_many :users, :dependent => :destroy
    # has_and_belongs_to_many :users
    # has_many :comments, :dependent => :destroy, foreign_key: :issue_id 
    has_many :comments 

    # belongs_to :projects
    belongs_to :projects, optional: true
    # 'optional: true' prevents the error
    # ActiveRecord::RecordInvalid: Validation failed: Projects must exist
    # when running rake db:seed

    validates :summary, presence: true
    validates :description, presence: true
    validates :status, presence: true
end
